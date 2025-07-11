import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/features/cart/model/cart_item.dart';

class CartItemsNotifier extends StateNotifier<List<CartItem>> {
  CartItemsNotifier() : super([]);
  void addProduct(Product product) {
    int index = state.indexWhere((p) => p.product.id == product.id);
    if (index >= 0) {
      state = [
        state[index].copyWith(quantity: state[index].quantity + 1),
        ...state.sublist(0, index),
        ...state.sublist(index + 1)
      ];
    } else {
      state = [CartItem(product: product, quantity: 1), ...state];
    }
  }

  void removeProduct(Product product) {
    int index = state.indexWhere((p) => p.product.id == product.id);
    if (index >= 0 && state[index].quantity > 1) {
      state = [
        ...state.sublist(0, index),
        state[index].copyWith(quantity: state[index].quantity - 1),
        ...state.sublist(index + 1)
      ];
    } else {
      state = state.where((p) => p.product.id != product.id).toList();
    }
  }
}

final cartItemsProvider =
    StateNotifierProvider<CartItemsNotifier, List<CartItem>>((ref) {
  return CartItemsNotifier();
});
