import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  TextEditingController _controllerPeso;
  TextEditingController _controllerAltura;

  void initState() {
    super.initState();
    _controllerPeso = TextEditingController();
    _controllerAltura = TextEditingController();
  }

  void dispose() {
    _controllerPeso.dispose();
    _controllerAltura.dispose();
    super.dispose();
  }

  String imageName = 'imc';

  void calcularIMC() {
    double peso = double.tryParse(_controllerPeso.text);
    double altura = double.tryParse(_controllerAltura.text);

    if (peso == null || altura == null) {
      limparCalculo(limparCampos: false);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Aviso'),
            content: Text('Um ou mais campos estão inválidos.'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                textColor: Colors.amber[700],
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    double imc = peso / (altura * altura);

    setState(() {
      if (imc <= 18.5) {
        imageName = 'abaixopeso';
      } else if (imc < 25) {
        imageName = 'normal';
      } else if (imc < 30) {
        imageName = 'sobrepeso';
      } else if (imc < 35) {
        imageName = 'obesidade1';
      } else if (imc < 40) {
        imageName = 'obesidade2';
      } else {
        imageName = 'obesidade3';
      }
    });
  }

  void limparCalculo({limparCampos: true}) {
    setState(() {
      imageName = 'imc';

      if (limparCampos) {
        _controllerAltura.text = '';
        _controllerPeso.text = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcular IMC'),
        backgroundColor: Colors.amber[700],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: TextField(
                            controller: _controllerPeso,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 8),
                              hintText: 'Peso',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _controllerAltura,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 8),
                            hintText: 'Altura',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: RaisedButton(
                            child: Text('Limpar'),
                            onPressed: limparCalculo,
                          ),
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          child: Text('Calcular'),
                          onPressed: calcularIMC,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          'images/$imageName.png',
                          height: 200,
                        ),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
