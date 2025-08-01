import 'package:flutter/material.dart';

import 'package:e_commerce/features/home/home_view.dart';
import 'package:e_commerce/features/cart/view/cart_view.dart';
import 'package:e_commerce/features/wishlist/wishlist_screen.dart';
import 'package:e_commerce/features/profile/view/profile_view.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = HomeScreen();
    String title = "E-Commerce App";
    if (_selectedPageIndex == 1) {
      activePage = CartScreen();
      title = "Cart";
    }
    if (_selectedPageIndex == 2) {
      activePage = WishlistScreen();
      title = "Wishlist";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => ProfileView(),
                  ));
            },
            icon: Icon(Icons.account_circle),
            iconSize: 30,
            color: Colors.white,
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: activePage,
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            iconSize: 28.0,
            currentIndex: _selectedPageIndex,
            onTap: _selectPage,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_rounded), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Wishlist')
            ]),
      ),
    );
  }
}
