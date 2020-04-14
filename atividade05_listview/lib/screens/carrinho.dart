import 'package:flutter/material.dart';
import 'package:atividade06_listview/models/itemcarrinho.dart';
import 'package:atividade06_listview/itemcarrinhomodel.dart';

class Carrinho extends StatefulWidget {
  final List<ItemCarrinho> items;

  Carrinho({@required this.items});

  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children:
            widget.items.map((item) => ItemCarrinhoModel(item: item)).toList(),
      );
  }
}
