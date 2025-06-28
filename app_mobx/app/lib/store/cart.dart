import 'package:mobx/mobx.dart';
import 'package:panucci_delivery/models/item.dart';

part "cart.g.dart";

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  List<Item> cartList = ObservableList<Item>();
  @observable
  double valorCarrinho = 0.0;

  @computed
  int get quantidadeItem => cartList.length;

  @computed
  bool get listaVazia => cartList.isEmpty;

  @action
  addItem(Item item) {
    cartList.add(item);
    atualizavalorCarrinho();
  }

  @action
  removeItem(Item item) {
    item.count > 1 ? cartList.remove(item) : null;
    atualizavalorCarrinho();
  }

  @action
  atualizavalorCarrinho() {
    valorCarrinho =
        cartList.fold(0.0, (sum, item) => sum + item.count * item.preco);
  }
}
