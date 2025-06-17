import 'package:flutter/material.dart';
import 'package:panucci_delivery/models/item.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:panucci_delivery/store/cart.dart';
import 'package:panucci_delivery/store/item.dart';
import 'package:provider/provider.dart';

class Contador extends StatelessWidget {
  Contador({super.key, required this.item});
  final Item item;
  final ItemStore itemStore = ItemStore();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartStore>(context, listen: false);
    return Observer(
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              if (itemStore.count > 0) {
                itemStore.decrement();
                cart.removeItem(item);
              }
            },
            child: const Icon(
              Icons.remove_circle_outline,
              size: 20,
            ),
          ),
          Text(itemStore.count.toString()),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              itemStore.increment();
              cart.addItem(item);
            },
            child: const Icon(
              Icons.add_circle_outline,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
