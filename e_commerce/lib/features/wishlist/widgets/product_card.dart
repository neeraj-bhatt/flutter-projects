import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:e_commerce/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                imageUrl: product.image,
                fit: BoxFit.contain,
                placeholder: (ctx, url) => Container(color: Colors.black12),
                placeholderFadeInDuration: const Duration(milliseconds: 100),
                errorWidget: (ctx, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              product.title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '\$${product.price}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              product.description,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSecondary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
