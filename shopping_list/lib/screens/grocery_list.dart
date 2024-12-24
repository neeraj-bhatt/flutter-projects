import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shopping_list/data/categories.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/screens/new_item.dart';
import 'package:shopping_list/widgets/grocery_list_item.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    _loadItems();
    super.initState();
  }

  void _loadItems() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      setState(() {
        _isLoading = false;
        _errorMessage = "User not authenticated.";
      });
      return;
    }

    final userId = user.uid;
    final url = Uri.https('flutter-9b5f8-default-rtdb.firebaseio.com',
        'shopping-list/$userId.json');

    try {
      final response = await http.get(url);
      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      if (response.statusCode >= 400) {
        setState(() {
          _errorMessage = 'Failed to fetch data. Please try again later.';
        });
        return;
      }
      final Map<String, dynamic> itemList = json.decode(response.body);
      final List<GroceryItem> tempList = [];
      for (final item in itemList.entries) {
        final tempCat = categories.entries
            .firstWhere(
                (catItem) => catItem.value.cat == item.value['category'])
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
    } catch (error) {
      _errorMessage = 'Something went wrong. Please try again later.';
    }
  }

  void _addItem() async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const NewItem(),
    ));
    _loadItems();
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });
    final url = Uri.https('flutter-9b5f8-default-rtdb.firebaseio.com',
        'shopping-list/${item.id}.json');
    final response = await http.delete(url);
    if (response.statusCode != 200) {
      // if item is not deleted from database undo action
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  Future<void> _logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Text("Uh Oh!!!  No Items Here"), Text("Add some new Items")],
      ),
    );

    if (_isLoading) {
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

    if (_errorMessage != null) {
      content = Center(
        child: Text(_errorMessage!),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _logOut,
          icon: const Icon(Icons.logout_outlined),
        ),
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
