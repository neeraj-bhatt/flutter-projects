import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/products_data.dart';
import 'package:e_commerce/widgets/products_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late Future<List<Product>> futureProducts;

  // @override
  // void initState() {
  //   super.initState();
  //   futureProducts = fetchProducts();
  // }

  Future<List<Product>> fetchProducts() async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(url);
    final List<dynamic> itemList = json.decode(response.body);
    final List<Product> products = itemList
        .map((product) => Product(
            id: product['id'],
            title: product['title'],
            description: product['description'],
            price: product['price'],
            image: product['image']))
        .toList();
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return ProductsGrid(productList: productList);
    // FutureBuilder<List<Product>>(
    //   future: futureProducts,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: const CircularProgressIndicator());
    //     }
    //     if (snapshot.hasError) {
    //       return Center(
    //         child: Text('Error : ${snapshot.error}'),
    //       );
    //     }
    //     final products = snapshot.data!;
    //     return GridView.builder(
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         childAspectRatio: 0.7,
    //         crossAxisSpacing: 8.0,
    //         mainAxisSpacing: 8.0,
    //       ),
    //       itemCount: products.length,
    //       itemBuilder: (context, index) =>
    //           ProductCard(product: products[index]),
    //     );
    //   },
    // ),
  }
}
