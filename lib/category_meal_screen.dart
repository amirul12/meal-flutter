import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
class CategoryMealScreen extends StatelessWidget {

  static const String routeName = '/category-meal';

  // final String id;
  // final String title;

  const CategoryMealScreen();

  @override
  Widget build(BuildContext context) {

    final routArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final String title = routArgs['title']!;
    final String categoryId = routArgs['id']!;
    
    final categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
    appBar: AppBar(title: Text(title)),
      body: ListView.builder(
          itemBuilder: (ctx, index){
        return Text(categoryMeals[index].title);
      }, itemCount: categoryMeals.length,)
    );
  }
}
