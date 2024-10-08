import 'package:flutter/material.dart';

import 'package:foodie_goodie/data/dummy_data.dart';
import 'package:foodie_goodie/widgets/category_grid_item.dart';
import 'package:foodie_goodie/screens/meals_screen.dart';
import 'package:foodie_goodie/models/category.dart';
import 'package:foodie_goodie/models/meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.selectedMeals});

  final List<Meal> selectedMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = selectedMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, meals: filteredMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
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
              _selectCategory(context, cat);
            },
          )
      ],
    );
  }
}
