import 'package:flutter/material.dart';

import 'package:e_commerce/models/product.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
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
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
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
              onPressed: () {},
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
