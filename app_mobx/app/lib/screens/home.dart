import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:panucci_delivery/components/item_list.dart';
import 'package:panucci_delivery/store/cart.dart';
import 'package:provider/provider.dart';
import '../components/categoria_text.dart';
import '../components/search_input.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartStore>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
                child: SearchInput(searchTextController: searchTextController)),
            const SliverToBoxAdapter(
                child: CategoriaText(titulo: "Mais comprados")),
            SliverToBoxAdapter(
              child: ItemList(categoria: "mais comprados"),
            ),
            const SliverToBoxAdapter(
                child: CategoriaText(titulo: "Para o almoço")),
            SliverToBoxAdapter(
              child: ItemList(categoria: "para o almoço"),
            ),
            const SliverToBoxAdapter(
                child: CategoriaText(titulo: "Para dividir")),
            SliverToBoxAdapter(
              child: ItemList(categoria: "para dividir"),
            ),
            Consumer<CartStore>(builder: (context, value, child) {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {},
                    child: Ink(
                        width: double.infinity,
                        height: 80,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surfaceTint,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10))),
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Observer(
                                    builder: (context) => Text(
                                      value.cartList
                                          .fold(0,
                                              (sum, item) => sum + item.count)
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.shopping_basket_outlined,
                                  size: 24,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                )
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Ver carrinho",
                              style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Observer(
                              builder: (context) => Text(
                                "R\$ ${value.cartList.fold(0.0, (sum, item) => sum + item.count * item.preco).toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                            ),
                          ),
                        ])),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
