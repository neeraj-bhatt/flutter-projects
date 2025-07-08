import 'dart:async';
import 'dart:io';

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
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    try {
      // timeout to avoid hanging forever
      final response = await http.get(url).timeout(Duration(seconds: 10));
      if (response.statusCode != 200) {
        throw HttpException('Server Responded : ${response.statusCode}');
      }
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
    } on SocketException {
      throw HttpException('No Internet Connection');
    } on FormatException {
      throw HttpException('Bad Json Format');
    } on TimeoutException {
      throw HttpException('Request Timed Out');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: futureProducts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: const CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error : ${snapshot.error}'),
          );
        }
        final products = snapshot.data!;
        return ProductsGrid(productList: productList);
      },
    );
  }
}
