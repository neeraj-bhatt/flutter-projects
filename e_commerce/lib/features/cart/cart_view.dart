import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_commerce/features/cart/viewmodel/cart_items_provider.dart';
import 'package:e_commerce/features/cart/widgets/cart_product.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});
  @override
  ConsumerState<CartScreen> createState() {
    return _CartScreenState();
  }
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartItemsProvider);

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
