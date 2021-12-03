import 'package:flutter/material.dart';
import 'package:meal/category_item.dart';
import 'package:meal/dummy_data.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView(
      children: DUMMY_CATEGORIED.map((cateDate) {
        return CategoryItem(title: cateDate.title, color: cateDate.color);
      }).toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisExtent: 20

      ),

    );
  }
}
