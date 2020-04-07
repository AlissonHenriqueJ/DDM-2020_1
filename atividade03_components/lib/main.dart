import 'package:flutter/material.dart';

import 'models/componentlist.dart';
import 'screens/component_examples.dart';
import 'componentslist/button_component.dart';
import 'componentslist/input_selection_component.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Root(),
    );
  }
}

class Root extends StatefulWidget {
  _Root createState() => _Root();
}

class _Root extends State<Root> {
  
  List<ComponentList> components = [
    new ButtonComponent(),
    new InputSelectionComponent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.clear_all),
        title: Text('Components'),
      ),
      body: ListView(
        children: components
            .map((c) => Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: 80,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(c.title),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ComponentExamples(
                                    componentsList: c,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 4,
                      color: Colors.grey[850],
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
}
