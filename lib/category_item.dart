import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CategoryItem extends StatelessWidget {

  final String title;
  final Color color;
  const CategoryItem({ required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
 margin: EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      child: Text(title),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          color.withOpacity(0.7),
          color
        ],
          begin: Alignment.topRight,
          end: Alignment.topLeft
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
