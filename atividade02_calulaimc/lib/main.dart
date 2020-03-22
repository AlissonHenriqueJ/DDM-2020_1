import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: RootPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    ));

class RootPage extends StatefulWidget {
  RootPage({Key key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcular imc'),
      ),
      body: Center(child: Container()),
    );
  }
}
