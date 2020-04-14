class ItemCarrinho {
  String nome;
  double valorUnitario;
  int quantidade;

  ItemCarrinho({this.nome, this.valorUnitario}) {
    quantidade = 0;
  }

  double calcularValor() {
    return valorUnitario * quantidade;
  }
}
