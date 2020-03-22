import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerMin;
  TextEditingController _controllerMax;

  String text = 'Nenhum número selecionado';

  void initState() {
    super.initState();
    _controllerMin = TextEditingController();
    _controllerMax = TextEditingController();
  }

  void dispose() {
    _controllerMin.dispose();
    _controllerMax.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text('Sorteio'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                    child: TextField(
                      controller: _controllerMin,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        hintText: 'Valor mínimo',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                    child: TextField(
                      controller: _controllerMax,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        hintText: 'Valor máximo',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: RaisedButton(
                color: Colors.grey[850],
                child: Text(
                  'Sortear',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    String invalidText = '';
                    bool hasInvalidValues = false;

                    int maxValue = int.tryParse(_controllerMax.text);
                    int minValue = int.tryParse(_controllerMin.text);

                    if (minValue == null || maxValue == null) {
                      hasInvalidValues = true;
                      invalidText =
                          'É necessário preencher os dois campos com um valor válido.';
                    } else if (minValue > maxValue) {
                      hasInvalidValues = true;
                      invalidText =
                          'O valor mínimo não pode ser maior que o valor máximo.';
                    }

                    if (hasInvalidValues) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Aviso'),
                            content: Text(invalidText),
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
                    } else {
                      int range = (maxValue - minValue) + 1;
                      int number = Random().nextInt(range) + minValue;

                      text = 'Número sorteado: $number';
                    }
                  });
                },
              ),
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
