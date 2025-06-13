import 'package:mobx/mobx.dart';

part 'item.g.dart';

class ItemStore = _ItemStore with _$ItemStore;

abstract class _ItemStore with Store {
  @observable
  int count = 0;
  @action
  void increment() => count++;
  @action
  void decrement() => count--;
}
