import 'package:flutter/material.dart';
class CategoryMealScreen extends StatelessWidget {

  static const String routeName = '/category-meal';

  // final String id;
  // final String title;

  const CategoryMealScreen();

  @override
  Widget build(BuildContext context) {

    final routArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final String title = routArgs['title']!;
    final String id = routArgs['id']!;


    return Scaffold(
    appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text("The Recioes for the Category!"),
    ), );
  }
}
