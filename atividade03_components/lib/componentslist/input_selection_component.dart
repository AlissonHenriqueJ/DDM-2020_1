import 'package:flutter/material.dart';
import 'package:atividade03_components/models/component_detail.dart';
import 'package:atividade03_components/models/componentlist.dart';

class InputSelectionComponent implements ComponentList {
  String title;

  InputSelectionComponent() {
    title = 'Input and selections';
  }

  @override
  List<ComponentDetail> getComponents(BuildContext context) {
    return [
      ComponentDetail(
        componentName: 'TextField',
        componentDetail: 'Input and selections',
        component: TextField(
          decoration: InputDecoration(
            labelText: 'Legenda',
          ),
        ),
      ),
      ComponentDetail(
        componentName: 'Checkbox',
        componentDetail: 'Input and selections',
        component: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Checkbox(
              value: true,
              onChanged: (bool newValue) {},
            ),
          ],
        ),
      ),
      ComponentDetail(
        componentName: 'Switch',
        componentDetail: 'Input and selections',
        component: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Switch(
              value: true,
              onChanged: (bool newValue) {},
            ),
          ],
        ),
      ),
      ComponentDetail(
        componentName: 'DatePicker',
        componentDetail: 'Input and selections',
        component: RaisedButton.icon(
          icon: Icon(Icons.arrow_drop_down),
          label: Text('Clique aqui'),
          clipBehavior: Clip.antiAlias,
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
          },
        ),
      ),
      ComponentDetail(
        componentName: 'TimePicker',
        componentDetail: 'Input and selections',
        component: RaisedButton.icon(
          icon: Icon(Icons.arrow_drop_down),
          label: Text('Clique aqui'),
          clipBehavior: Clip.antiAlias,
          onPressed: () {
            showTimePicker(
              context: context,
              initialTime: new TimeOfDay.now(),
            );
          },
        ),
      ),
      ComponentDetail(
        componentName: 'Chip',
        componentDetail: 'Input and selections',
        component: Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            child: Text('B'),
          ),
          label: Text('Aaron Burr'),
        ),
      ),
    ];
  }
}
