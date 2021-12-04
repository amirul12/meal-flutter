import 'package:flutter/material.dart';
class CategoryMealScreen extends StatelessWidget {

  final String id;
  final String title;

  const CategoryMealScreen({required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text("The Recioes for the Category!"),

    ), );
  }
}
