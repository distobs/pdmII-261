import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../widgets/product_card.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final products = [
    Product(
      id: "1",
      name: "Notebook",
      price: 3500,
    ),
    Product(
      id: "2",
      name: "Mouse",
      price: 120,
    ),
    Product(
      id: "3",
      name: "Teclado",
      price: 300,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loja"),

        actions: [
          Consumer<CartProvider>(
            builder: (_, cart, __) {
              return IconButton(
                icon: Badge(
                  label: Text(
                    "${cart.count}",
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          CartScreen(),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),

      body: ListView(
        children: products
            .map(
              (p) => ProductCard(
                product: p,
              ),
            )
            .toList(),
      ),
    );
  }
}
