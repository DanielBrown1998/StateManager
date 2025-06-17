class Item {
  Item(this.nome, this.categoria, this.preco, this.uri, {this.count = 1});

  final String nome;
  final String categoria;
  final String uri;
  final double preco;
  int count;
}
