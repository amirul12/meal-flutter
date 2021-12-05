import 'package:flutter/material.dart';
import 'package:meal/widgets/category_item.dart';
import 'package:meal/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(10),
        children: DUMMY_CATEGORIED.map((tx) {
          return CategoryItem(
            id: tx.id,
            title: tx.title,
            color: tx.color,
          );
        }).toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
