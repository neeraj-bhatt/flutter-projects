import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shopping_list/data/categories.dart';
import 'dart:convert';

import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/screens/new_item.dart';
import 'package:shopping_list/widgets/grocery_list_item.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  var _isLoading = true;

  @override
  void initState() {
    _loadItems();
    super.initState();
  }

  List<GroceryItem> _groceryItems = [];

  void _loadItems() async {
    final url = Uri.https(
        'flutter-9b5f8-default-rtdb.firebaseio.com', 'shopping-list.json');
    final response = await http.get(url);
    final Map<String, dynamic> itemList =
        json.decode(response.body);
    final List<GroceryItem> tempList = [];
    for (final item in itemList.entries) {
      final tempCat = categories.entries
          .firstWhere((catItem) => catItem.value.cat == item.value['category'])
          .value;
      tempList.add(
        GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: tempCat),
      );
    }
    setState(() {
      _groceryItems = tempList;
      _isLoading = false;
    });
  }

  void _addItem() async {
    await Navigator.of(context).push<GroceryItem>(MaterialPageRoute(
      builder: (context) => const NewItem(),
    ));
    _loadItems();
  }

  void _removeItem(GroceryItem item) {
    _groceryItems.remove(item);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Text("Uh Oh!!!  No Items Here"), Text("Add some new Items")],
      ),
    );

    if(_isLoading){
      content = const Center(child: CircularProgressIndicator());
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
            key: ValueKey(_groceryItems[index].id),
            onDismissed: (direction) {
              _removeItem(_groceryItems[index]);
            },
            child: GroceryListItem(item: _groceryItems[index])),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
