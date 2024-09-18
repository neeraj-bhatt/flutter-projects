import 'package:flutter/material.dart';

import 'package:foodie_goodie/screens/category_screen.dart';
import 'package:foodie_goodie/screens/meals_screen.dart';
import 'package:foodie_goodie/models/meal.dart';
import 'package:foodie_goodie/widgets/drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  void _showInfoMessage(String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }

  void _toggleFavoriteMeals(Meal meal) {
    if (_favouriteMeals.contains(meal)) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      _showInfoMessage("Meal is no longer Favorite");
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      _showInfoMessage("Marked as Favorite");
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier){
    if(identifier == "filter"){

    }else{
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(
      onToggleFavorite: _toggleFavoriteMeals,
    );
    var activePageTitle = "Categories";

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
          meals: _favouriteMeals, onToggleFavorite: _toggleFavoriteMeals);
      activePageTitle = "Your Favourites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: CustomDrawer(onSelectScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourites"),
        ],
      ),
    );
  }
}
