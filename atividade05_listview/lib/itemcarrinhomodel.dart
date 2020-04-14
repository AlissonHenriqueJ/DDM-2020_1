import 'package:flutter/material.dart';
import 'models/itemcarrinho.dart';

class ItemCarrinhoModel extends StatefulWidget {
  final ItemCarrinho item;

  ItemCarrinhoModel({@required this.item});

  @override
  _ItemCarrinhoModelState createState() => _ItemCarrinhoModelState();
}

class _ItemCarrinhoModelState extends State<ItemCarrinhoModel> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.all(8),
        height: 70,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${widget.item.nome}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Valor Un.: R\$ ${widget.item.valorUnitario.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                if (widget.item.quantidade > 0) {
                  setState(() {
                    widget.item.quantidade--;
                  });
                }
              },
              iconSize: 28,
              icon: Icon(
                Icons.remove,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              width: 50,
              child: Text(
                '${widget.item.quantidade}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              iconSize: 28,
              icon: Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                setState(() {
                  widget.item.quantidade++;
                });
              },
            )
          ],
        ),
      ),
      Divider(
        height: 4,
        color: Colors.grey[700],
      ),
    ]);
  }
}
