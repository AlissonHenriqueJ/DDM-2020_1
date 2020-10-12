import 'package:atividade_appnotes/views/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(AppNotes());

class AppNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        accentColor: Colors.orange[800],
        primaryColor: Colors.teal[800],
        colorScheme: ColorScheme.light(
          primary: Colors.teal[800],
          secondary: Colors.orange[800],
        ),
      ),
      color: Colors.grey,
      home: Home(),
    );
  }
}
