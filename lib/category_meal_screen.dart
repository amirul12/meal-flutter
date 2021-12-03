import 'package:flutter/material.dart';
class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Category"),),
      body: Center(
        child: Text("The Recioes for the Category!"),

    ), );
  }
}
