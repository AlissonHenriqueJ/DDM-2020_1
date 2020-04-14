import 'package:flutter/material.dart';

import 'models/itemcarrinho.dart';

import 'screens/carrinho.dart';
import 'screens/total.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Root(title: 'Compras'),
    );
  }
}

class Root extends StatefulWidget {
  final List<ItemCarrinho> items = [
    ItemCarrinho(nome: 'Achocolatado - 400g', valorUnitario: 5.6),
    ItemCarrinho(nome: 'Açúcar - 1kg', valorUnitario: 3),
    ItemCarrinho(nome: 'Arroz - 1kg', valorUnitario: 2.75),
    ItemCarrinho(nome: 'Café - 500g', valorUnitario: 12),
    ItemCarrinho(nome: 'Creme de Leite - 200g', valorUnitario: 2.4),
    ItemCarrinho(nome: 'Feijão - 1kg', valorUnitario: 5.7),
    ItemCarrinho(nome: 'Leite - 1L', valorUnitario: 2.6),
    ItemCarrinho(nome: 'Macarrão - 500g', valorUnitario: 3.3),
    ItemCarrinho(nome: 'Óleo de soja - 900ml', valorUnitario: 2.8),
    ItemCarrinho(nome: 'Ovo - 12un', valorUnitario: 5.9),
    ItemCarrinho(nome: 'Pipoca - 500g', valorUnitario: 2.8),
    ItemCarrinho(nome: 'Polentina - 500g', valorUnitario: 1.7),
    ItemCarrinho(nome: 'Sabão em pó - 1kg', valorUnitario: 8),
    ItemCarrinho(nome: 'Sal - 1Kg', valorUnitario: 1.8),
    ItemCarrinho(nome: 'Trigo - 1Kg', valorUnitario: 2.8),
  ];
  final String title;

  Root({Key key, this.title}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getScreen() {
    switch (_selectedIndex) {
      case 0:
        return Carrinho(items: widget.items);
      case 1:
        return Total(
            items: widget.items.where((item) => item.quantidade > 0).toList());
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Icon(Icons.store),
      ),
      body: getScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Carrinho'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            title: Text('Nota'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
