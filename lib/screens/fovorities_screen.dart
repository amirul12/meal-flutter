import 'package:flutter/material.dart';
import 'package:meal/meal.dart';
import 'package:meal/widgets/meal_item.dart';

class FavoritiesScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

  FavoritiesScreen({required this.favoriteMeal});

  @override
  Widget build(BuildContext context) {
    return favoriteMeal.isEmpty
        ? Center(
            child: Text('You have no favorites yet -  start adding some! '),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favoriteMeal[index].id,
                title: favoriteMeal[index].title,
                imageUrl: favoriteMeal[index].imageUrl,
                complexity: favoriteMeal[index].complexity,
                affordability: favoriteMeal[index].affordability,
                duration: favoriteMeal[index].duration,
              );
            },
            itemCount: favoriteMeal.length,
          );
  }
}
