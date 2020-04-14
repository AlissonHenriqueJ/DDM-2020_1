import 'package:flutter/material.dart';

import 'models/itemcarrinho.dart';

class ItemNotaModel extends StatelessWidget {
  final ItemCarrinho item;

  ItemNotaModel({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      height: 50,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${item.nome} ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  'x${item.quantidade} (Valor Un.: R\$ ${item.valorUnitario.toStringAsFixed(2)})',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              '${item.calcularValor().toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
