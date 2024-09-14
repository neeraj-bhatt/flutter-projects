import 'package:flutter/material.dart';

import 'package:foodie_goodie/models/meal.dart';
import 'package:foodie_goodie/screens/meal_detail_screen.dart';
import 'package:foodie_goodie/widgets/meals_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealDetailScreen(meal: meal),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (meals.isEmpty) {
      body = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Uh oh.... Nothing here",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer)),
            const SizedBox(height: 20),
            Text("Try selecting different Category",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer)),
          ],
        ),
      );
    } else {
      body = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealsItem(
          meal: meals[index],
          onSelectMeal: (){_selectMeal(context, meals[index]);},
        ),
      );
    }

    if(title == null){
      return body;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: body,
    );
  }
}
