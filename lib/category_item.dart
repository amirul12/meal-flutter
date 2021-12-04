import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({required this.id, required this.title, required this.color,});

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed('/category-meals', arguments: {
      'id': id,
      'title': title
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectCategory(context),
      child: Container(
        margin: EdgeInsets.all(5),
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topRight,
              end: Alignment.topLeft),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
