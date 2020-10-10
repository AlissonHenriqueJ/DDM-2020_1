import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:http/http.dart' as http;

import 'pais.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Paises'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  createCard(Pais pais) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: getLeading(pais.flag),
            ),
            Text(
              pais.translations.br,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  getLeading(String flag) {
    try {
      return SvgPicture.network(
        flag,
        fit: BoxFit.fitWidth,
      );
    } catch (e) {
      return Icon(
        Icons.error,
        color: Colors.red,
      );
    }
  }

  List<Pais> parser(var response) {
    var list = jsonDecode(response);

    assert(list is List);

    List<Pais> paises = [];
    for (var item in list) {
      paises.add(Pais.fromJson(item));
    }

    paises.sort((paisA, paisB) =>
        paisA.translations.br.compareTo(paisB.translations.br));

    return paises;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.place),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: http.get('https://restcountries.eu/rest/v2/all'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none &&
              (snapshot.hasData == null ||
                  snapshot.data == null ||
                  snapshot.data.body == null)) {
            //print('project snapshot data is: ${projectSnap.data}');
            return Container();
          }
          List<Pais> paises = parser(snapshot.data.body);

          print(snapshot.data.body);

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: paises.length,
            itemBuilder: (context, index) => createCard(paises[index]),
          );
        },
      ),
    );
  }
}
