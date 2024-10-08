import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:foodie_goodie/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleFavoriteMealStatue(Meal meal) {
    final isExisting = state.contains(meal);

    if (isExisting) {
      state = state.where((m) =>
        m.id != meal.id
      ).toList();
      return false;
    }
    else{
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref){
  return FavoriteMealsNotifier();
});

