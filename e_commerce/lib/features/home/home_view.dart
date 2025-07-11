import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_commerce/features/wishlist/widgets/products_grid.dart';
import 'package:e_commerce/features/home/home_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(homeProductsProvider);

    return products.when(
        data: (products) => ProductsGrid(productList: products),
        error: (error, _) => Center(child: Text('Error : $error')),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
