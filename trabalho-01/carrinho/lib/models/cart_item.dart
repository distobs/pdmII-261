import 'product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  double get subtotal =>
      product.price * quantity;

  Map<String, dynamic> toJson() {
    return {
      "id": product.id,
      "name": product.name,
      "price": product.price,
      "quantity": quantity,
    };
  }

  factory CartItem.fromJson(
    Map<String, dynamic> json,
  ) {
    return CartItem(
      product: Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
      ),
      quantity: json["quantity"],
    );
  }
}
