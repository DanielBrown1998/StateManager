import 'package:app_getx/controller/carrinho_controller.dart';
import 'package:app_getx/controller/cartao_controller.dart';
import 'package:app_getx/utils/snackbars.dart';
import 'package:flutter/material.dart';

import '../../models/item.dart';
import 'package:get/get.dart';

class Cartao extends StatelessWidget {
  const Cartao({super.key, required this.item});
  final Item item;
  CartaoController get cartaoController =>
      Get.put(CartaoController(), tag: "${item.nome} ${item.categoria}");
  CarrinhoController get carrinhoController =>
      Get.find<CarrinhoController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF6F6F6),
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 134),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage(item.uri),
              width: double.infinity,
              height: 50,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      item.nome,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text("R\$ ${item.preco.toStringAsFixed(2)}"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          if (cartaoController.counter.value > 0) {
                            cartaoController.decrement();
                            carrinhoController.removeItem(item);
                            AppSnackBars.showRemoveItemSnackBar(item);
                          }
                        },
                        child: const Icon(
                          Icons.remove_circle_outline,
                          size: 20,
                        ),
                      ),
                      Obx(() => Text(cartaoController.counter.toString())),
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          cartaoController.increment();
                          carrinhoController.addItem(item);
                          AppSnackBars.showAddItemSnackBar(item);
                        },
                        child: const Icon(Icons.add_circle_outline, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
