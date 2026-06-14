import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(product.name),
        subtitle: Text(
          "R\$ ${product.price}",
        ),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () {
            context
                .read<CartProvider>()
                .add(product);
          },
        ),
      ),
    );
  }
}
