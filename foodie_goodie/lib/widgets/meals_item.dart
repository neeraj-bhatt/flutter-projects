import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:foodie_goodie/models/meal.dart';
import 'package:foodie_goodie/widgets/meal_item_trait.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function() onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: onSelectMeal,
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: CachedNetworkImage(
                imageUrl: meal.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                fadeInDuration: const Duration(microseconds: 300),
                placeholderFadeInDuration: const Duration(microseconds: 100),
                placeholder: (context, url) => Container(color: Colors.black12,),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                  child: Column(children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule, label: "${meal.duration}min"),
                        const SizedBox(width: 15),
                        MealItemTrait(icon: Icons.work, label: complexityText),
                        const SizedBox(width: 15),
                        MealItemTrait(
                            icon: Icons.attach_money, label: affordabilityText),
                      ],
                    ),
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
