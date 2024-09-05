import 'package:flutter/material.dart';

import 'package:foodie_goodie/data/dummy_data.dart';
import 'package:foodie_goodie/widgets/category_grid_item.dart';
import 'package:foodie_goodie/screens/meals_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            const MealsScreen(title: "Some Category", meals: [])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick your Category"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 2),
        children: [
          for (final cat in availableCategories)
            CategoryGridItem(
              category: cat,
              onSelectCategory: () {
                _selectCategory(context);
              },
            )
        ],
      ),
    );
  }
}
