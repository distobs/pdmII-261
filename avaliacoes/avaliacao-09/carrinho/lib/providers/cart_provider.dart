import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  CartProvider() {
    loadCart();
  }

  double get total {
    return _items.fold(
      0,
      (sum, item) =>
          sum + item.subtotal,
    );
  }

  int get count {
    return _items.fold(
      0,
      (sum, item) =>
          sum + item.quantity,
    );
  }

  void add(Product product) {

    final existing =
        _items.where(
          (e) =>
              e.product.id ==
              product.id,
        );

    if (existing.isNotEmpty) {
      existing.first.quantity++;
    } else {
      _items.add(
        CartItem(
          product: product,
        ),
      );
    }

    saveCart();

    notifyListeners();
  }

  void remove(Product product) {

    final item =
        _items.firstWhere(
      (e) =>
          e.product.id ==
          product.id,
    );

    item.quantity--;

    if (item.quantity <= 0) {
      _items.remove(item);
    }

    saveCart();

    notifyListeners();
  }

  Future<void> saveCart() async {

    final prefs =
        await SharedPreferences
            .getInstance();

    final jsonList =
        _items
            .map(
              (e) =>
                  jsonEncode(
                    e.toJson(),
                  ),
            )
            .toList();

    await prefs.setStringList(
      "cart",
      jsonList,
    );
  }

  Future<void> loadCart() async {

    final prefs =
        await SharedPreferences
            .getInstance();

    final stored =
        prefs.getStringList(
          "cart",
        );

    if (stored == null) {
      return;
    }

    _items.clear();

    for (final item in stored) {
      _items.add(
        CartItem.fromJson(
          jsonDecode(item),
        ),
      );
    }

    notifyListeners();
  }
}
