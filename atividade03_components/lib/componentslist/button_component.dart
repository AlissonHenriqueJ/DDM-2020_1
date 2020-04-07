import 'package:flutter/material.dart';
import 'package:atividade03_components/models/component_detail.dart';
import 'package:atividade03_components/models/componentlist.dart';

class ButtonComponent implements ComponentList {
  String title;

  ButtonComponent() {
    title = 'Buttons';
  }
  @override
  List<ComponentDetail> getComponents(BuildContext context) {
    return [
      ComponentDetail(
        component: OutlineButton(
          child: Text("Clique aqui"),
          borderSide: BorderSide(color: Colors.black),
          onPressed: () {
            defaultButtonFunction(context);
          },
        ),
        componentName: 'OutlineButton',
        componentDetail:
            'OutlineButton(\n     child: Text("Clique aqui"),\n     borderSide: BorderSide(\n          color: Colors.black\n     ),\n     onPressed: () {}\n);',
      ),
      ComponentDetail(
        component: FlatButton(
          child: Text("Clique aqui"),
          onPressed: () {
            defaultButtonFunction(context);
          },
        ),
        componentName: 'FlatButton',
        componentDetail:
            'FlatButton(\n     child: Text("Clique aqui"),\n     onPressed: () {}\n);',
      ),
      ComponentDetail(
        component: RaisedButton(
          child: Text("Clique aqui"),
          onPressed: () {
            defaultButtonFunction(context);
          },
        ),
        componentName: 'RaisedButton',
        componentDetail:
            'RaisedButton(\n     child: Text("Clique aqui"),\n     onPressed: () {}\n);',
      ),
      ComponentDetail(
        component: RaisedButton.icon(
          icon: Icon(Icons.touch_app),
          label: Text('Clique aqui'),
          onPressed: () {
            defaultButtonFunction(context);
          },
        ),
        componentName: 'RaisedButton.icon',
        componentDetail:
            'RaisedButton.icon(\n     icon: Icon(Icons.touch_app),\n     label: Text("Clique aqui"),\n     onPressed: () {}\n);',
      ),
      ComponentDetail(
        component: IconButton(
          icon: Icon(Icons.touch_app),
          onPressed: () {
            defaultButtonFunction(context);
          },
        ),
        componentName: 'IconButton',
        componentDetail:
            'IconButton(\n     icon: Icon(Icons.touch_app),\n     onPressed: () {}\n);',
      ),
      ComponentDetail(
        component: FloatingActionButton(
          child: Icon(Icons.touch_app),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            defaultButtonFunction(context);
          },
        ),
        componentName: 'FloatingActionButton',
        componentDetail:
            'FloatingActionButton(\n     child: Icon(Icons.touch_app),\n     onPressed: () {}\n);',
      ),
    ];
  }

  void defaultButtonFunction(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Click'),
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
