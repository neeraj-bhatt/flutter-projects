import 'package:flutter/material.dart';

import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/product_screen.dart';
import 'package:e_commerce/widgets/product_card.dart';

class ProductsGrid extends StatelessWidget {
  final List<Product> productList;
  const ProductsGrid({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.8,
      ),
      padding: const EdgeInsets.all(8.0),
      itemCount: productList.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductScreen(product: productList[index]),
          ));
        },
        borderRadius: BorderRadius.circular(12.0),
        child: ProductCard(product: productList[index]),
      ),
    );
  }
}
