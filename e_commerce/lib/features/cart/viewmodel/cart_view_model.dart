import 'package:e_commerce/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_commerce/features/cart/model/cart_item.dart';
import 'package:e_commerce/features/cart/viewmodel/cart_items_provider.dart';

class CartViewModel {
  final Ref ref;
  CartViewModel(this.ref);

  List<CartItem> get cartItems => ref.watch(cartItemsProvider);

  void addToCart(Product product) {
    ref.read(cartItemsProvider.notifier).addProduct(product);
  }

  void removeFromCart(Product product) {
    ref.read(cartItemsProvider.notifier).removeProduct(product);
  }

  void buyProduct(Product product) {
    // TODO : Checkout flow
    print('Buying Product : ${product.title}');
  }

  double get totalPrice => cartItems.fold(
        0,
        (previousValue, item) =>
            previousValue + item.product.price * item.quantity,
      );
}

final cartViewModelProvider = Provider((ref) => CartViewModel(ref));
