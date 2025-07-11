import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_commerce/providers/favorites_provider.dart';
import 'package:e_commerce/features/wishlist/widgets/products_grid.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishListItems = ref.watch(favoriteItemsProvider);
    if(wishListItems.isEmpty){
      return Center(
        child: Image.asset(
          'assets/images/wishlist.png',
          width: 200,
          height: 200,
        ),
      );
    }
    return ProductsGrid(productList: wishListItems);
  }
}
