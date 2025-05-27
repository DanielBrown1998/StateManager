import 'package:app_getx/models/item.dart';
import 'package:get/get.dart';

class CarrinhoController extends GetxController {
  // Observable list to hold the items in the cart
  var items = <Item>[].obs;

  // Method to add an item to the cart
  void addItem(Item item) {
    items.add(item);
    update(); // Notify listeners about the change
  }

  // Method to remove an item from the cart
  void removeItem(Item item) {
    items.remove(item);
    update(); // Notify listeners about the change
  }

  // Method to clear the cart
  void clearCart() {
    items.clear();
    update(); // Notify listeners about the change
  }

  // Method to get the total price of items in the cart
  double get totalPrice {
    return items.fold(0.0, (sum, item) => sum + item.preco);
  }
  // Method to get the total number of items in the cart
  int get totalItems {
    return items.length;
  }

}
