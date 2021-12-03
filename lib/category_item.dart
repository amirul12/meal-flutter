import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CategoryItem extends StatelessWidget {

  final String ?title;
  final Color? color;
  CategoryItem({Key? key, required this.title, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(title!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          color!.withOpacity(0.7),
          color!
        ]
        )
      ),
    );
  }
}
