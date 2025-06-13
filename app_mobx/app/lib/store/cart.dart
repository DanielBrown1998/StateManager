import 'package:mobx/mobx.dart';

part "cart.g.dart";

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  int total = 0;
  // List<Item> cartList = [];

  @action
  addCart() => total++;

  @action
  removeCart() => total--;

  // @action
  // addItem(Item item) =>
  //     cartList.contains(item) ? item.count++ : cartList.add(item);

  // @action
  // removeItem(Item item) =>
  //     item.count > 1 ? item.count-- : cartList.remove(item);

  // @action
  // double sumValue() =>
  //     cartList.fold(0.0, (sum, item) => sum + item.count * item.preco);

  // @action
  // int countTotal() => cartList.fold(0, (sum, item) => sum + item.count);
}
