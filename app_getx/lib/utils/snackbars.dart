import 'package:app_getx/models/item.dart';
import 'package:get/get.dart';

class AppSnackBars {
  static showAddItemSnackBar(Item item) {
    return Get.showSnackbar(
      GetSnackBar(
        title: "Item adicionado",
        message: "${item.nome} foi adicionado ao carrinho.",
        duration: const Duration(seconds: 1),
      ),
    );
  }
  static showRemoveItemSnackBar(Item item) {
    return Get.showSnackbar(
      GetSnackBar(
        title: "Item removido",
        message: "${item.nome} foi removido do carrinho.",
        duration: const Duration(seconds: 1),
      ),
    );
  }
  static getPayment(){
    return Get.showSnackbar(
      GetSnackBar(
        title: "Pagamento",
        message: "Pagamento realizado com sucesso.",
        duration: const Duration(seconds: 2),
      ),
    );
  }

}
