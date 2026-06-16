import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final cart =
        context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title:
            const Text(
          "Carrinho",
        ),
      ),

      body:
          cart.items.isEmpty

              ? const Center(
                  child: Text(
                    "Carrinho vazio",
                  ),
                )

              : Column(
                  children: [

                    Expanded(
                      child:
                          ListView.builder(

                        itemCount:
                            cart.items.length,

                        itemBuilder:
                            (
                              context,
                              index,
                            ) {

                          final item =
                              cart.items[
                                  index];

                          return Card(
                            margin:
                                const EdgeInsets
                                    .symmetric(
                              horizontal:
                                  12,
                              vertical:
                                  6,
                            ),

                            child:
                                ListTile(

                              title:
                                  Text(
                                item.product
                                    .name,
                              ),

                              subtitle:
                                  Column(

                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,

                                children: [

                                  Text(
                                    "R\$ ${item.product.price}",
                                  ),

                                  Text(
                                    "Subtotal: R\$ ${item.subtotal.toStringAsFixed(2)}",
                                  ),
                                ],
                              ),

                              trailing:
                                  Row(

                                mainAxisSize:
                                    MainAxisSize
                                        .min,

                                children: [

                                  IconButton(

                                    icon:
                                        const Icon(
                                      Icons
                                          .remove,
                                    ),

                                    onPressed:
                                        () {

                                      cart.remove(
                                        item
                                            .product,
                                      );
                                    },
                                  ),

                                  Text(
                                    "${item.quantity}",
                                  ),

                                  IconButton(

                                    icon:
                                        const Icon(
                                      Icons
                                          .add,
                                    ),

                                    onPressed:
                                        () {

                                      cart.add(
                                        item
                                            .product,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    Container(

                      padding:
                          const EdgeInsets
                              .all(
                        16,
                      ),

                      child:
                          Column(

                        crossAxisAlignment:
                            CrossAxisAlignment
                                .stretch,

                        children: [

                          Text(
                            "Itens: ${cart.count}",
                          ),

                          const SizedBox(
                            height:
                                8,
                          ),

                          Text(

                            "Total: R\$ ${cart.total.toStringAsFixed(2)}",

                            style:
                                const TextStyle(

                              fontSize:
                                  24,

                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),

                          const SizedBox(
                            height:
                                16,
                          ),

                          ElevatedButton(

                            onPressed:
                                () {

                              ScaffoldMessenger
                                      .of(
                                    context,
                                  )
                                  .showSnackBar(

                                const SnackBar(

                                  content:
                                      Text(
                                    "Checkout não implementado",
                                  ),
                                ),
                              );
                            },

                            child:
                                const Text(
                              "Finalizar Compra",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}
