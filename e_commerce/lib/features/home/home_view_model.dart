import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:e_commerce/models/product.dart';

class HomeRepository{
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
}

final homeRepositoryProvider = Provider((ref) => HomeRepository());

final homeProductsProvider = FutureProvider<List<Product>>((ref) async{
  final repo = ref.read(homeRepositoryProvider);
  return repo.fetchProducts();
});