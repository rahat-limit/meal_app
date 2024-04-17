import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_app/models/meal.dart';

class Favoritemeal_appNotifier extends StateNotifier<List<Meal>> {
  Favoritemeal_appNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoritemealProvider =
    StateNotifierProvider<Favoritemeal_appNotifier, List<Meal>>((ref) {
  return Favoritemeal_appNotifier();
});
