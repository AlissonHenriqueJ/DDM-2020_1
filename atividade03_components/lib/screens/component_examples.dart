import "package:flutter/material.dart";
import 'package:atividade03_components/models/componentlist.dart';

class ComponentExamples extends StatefulWidget {
  final ComponentList componentsList;

  ComponentExamples({this.componentsList});

  @override
  _ComponentExamplesState createState() => _ComponentExamplesState();
}

class _ComponentExamplesState extends State<ComponentExamples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.componentsList.title),
      ),
      body: ListView(
          children: widget.componentsList
              .getComponents(context)
              .map((c) => Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(16),
                        height: 85,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(c.componentName),
                            ),
                            Expanded(
                              flex: 1,
                              child: c.component,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.info,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                infoButton(c.componentName, c.componentDetail);
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 4, color: Colors.grey[850])
                    ],
                  ))
              .toList()),
    );
  }

  void infoButton(String title, String description) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(description),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
