import 'package:mobx/mobx.dart';
import 'package:panucci_delivery/models/item.dart';

part "cart.g.dart";

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  List<Item> cartList = ObservableList<Item>();

  @action
  addItem(Item item) {
    cartList.add(item);
  }

  @action
  removeItem(Item item) {
    item.count > 1 ? cartList.remove(item) : null;
  }
}
