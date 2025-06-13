import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/providers/cart_items_provider.dart';
import 'package:e_commerce/providers/favorites_provider.dart';

class ProductScreen extends ConsumerWidget {
  final Product product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistItems = ref.watch(favoriteItemsProvider);
    final markedFavorite = wishlistItems.contains(product);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                final isAdded = ref
                    .watch(favoriteItemsProvider.notifier)
                    .toggleWishlistItem(product);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        isAdded ? 'Item added to Wishlist' : 'Item removed',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onSecondary)),
                    margin:
                        EdgeInsets.only(left: 6.0, right: 6.0, bottom: 18.0),
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.blueGrey.shade200,
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              icon: Icon(Icons.favorite),
              color: markedFavorite
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.white,
              iconSize: markedFavorite ? 34 : 28,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Description',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer),
            ),
            const SizedBox(height: 22),
            Container(
              width: double.infinity,
              height: 400.0,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Image.network(
                product.image,
                // fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 22),
            ElevatedButton(
              onPressed: () {
                ref.watch(cartItemsProvider.notifier).addProduct(product);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Item added to cart successfully",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    margin:
                        EdgeInsets.only(left: 6.0, right: 6.0, bottom: 18.0),
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.blueGrey.shade200,
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(8.0),
                backgroundColor: Colors.yellow,
                minimumSize: Size(double.infinity, 46),
              ),
              child: Text(
                'Add to Cart',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  backgroundColor: Colors.orange,
                  minimumSize: Size(double.infinity, 46),
                ),
                child: Text(
                  'Buy Now',
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
          ],
        ),
      ),
    );
  }
}
