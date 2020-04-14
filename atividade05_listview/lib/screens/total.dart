import 'package:flutter/material.dart';
import 'package:atividade06_listview/models/itemcarrinho.dart';
import 'package:atividade06_listview/itemnotamodel.dart';

class Total extends StatelessWidget {
  final List<ItemCarrinho> items;
  Total({@required this.items});

  double calcularTotalItems() {
    double total = 0;

    items.forEach((item) => total += item.calcularValor());

    return total;
  }

  @override
  Widget build(BuildContext context) {
    
    if (items.length == 0) {
      return Center(
        child: Text('Nenhum item incluído no carrinho.'),
      );
    }

    return ListView(
      children: items.map((item) => ItemNotaModel(item: item)).toList(),
    );
  }
}
