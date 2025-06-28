import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:panucci_delivery/components/order_item.dart';
import 'package:panucci_delivery/store/cart.dart';
import 'package:provider/provider.dart';
import '../components/payment_method.dart';
import '../components/payment_total.dart';

class Checkout extends StatelessWidget {
  const Checkout({
    Key? key,
    required this.homeContext,
  }) : super(key: key);
  final BuildContext homeContext;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartStore>(homeContext, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Observer(
          builder: (homeContext) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomScrollView(
              slivers: <Widget>[
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Pedido",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (homeContext, index) {
                    return OrderItem(item: cart.cartList[index]);
                  },
                  childCount: cart.cartList.length,
                )),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Pagamento",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: PaymentTotal(
                    total: cart.valorCarrinho,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: PaymentMethod(),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Confirmar",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: PaymentTotal(total: 00.00),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            foregroundColor: Colors.white,
                            backgroundColor:
                                Theme.of(context).colorScheme.surfaceTint),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.account_balance_wallet),
                              ),
                              Text(
                                "Pedir",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )
                            ]),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
