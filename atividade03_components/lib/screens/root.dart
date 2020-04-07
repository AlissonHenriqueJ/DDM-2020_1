import 'package:flutter/material.dart';

import 'package:atividade03_components/screens/component_examples.dart';
import 'package:atividade03_components/componentslist/button_component.dart';
import 'package:atividade03_components/componentslist/input_selection_component.dart';

class Root extends StatefulWidget {
  _Root createState() => _Root();
}

class _Root extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.clear_all),
        title: Text('Components'),
      ),
      body: ListView(
          children: [new ButtonComponent(), new InputSelectionComponent()]
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
              .toList()),
    );
  }
}
