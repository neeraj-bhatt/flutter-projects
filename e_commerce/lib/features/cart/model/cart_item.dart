import 'package:e_commerce/models/product.dart';

class CartItem {
  final Product product;
  final int quantity;
  const CartItem({required this.product, required this.quantity});
  CartItem copyWith({Product? product, int? quantity}) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
