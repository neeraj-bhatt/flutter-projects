import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_commerce/features/cart/view/cart_product.dart';
import 'package:e_commerce/features/cart/viewmodel/cart_view_model_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartViewModelProvider);

    if (cartItems.isEmpty) {
      return Center(
        child: Image.asset(
          'assets/images/EmptyCart.png',
          width: 300,
          height: 300,
        ),
      );
    }
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (ctx, index) =>
          CartProduct(item: cartItems[index]),
    );
  }
}
