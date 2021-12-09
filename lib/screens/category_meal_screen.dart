import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/meal.dart';
import 'package:meal/widgets/main_drawer.dart';
import 'package:meal/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String routeName = '/category-meal';


  final List<Meal> avaibaleList;

   CategoryMealScreen({required this.avaibaleList});

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

    String title ="";
    String categoryId = "";

    var loadFirstTime =false;

    late List<Meal> displayMeal;



  void removeItem(String mealId){

    setState(() {
      displayMeal.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {

    if(loadFirstTime == false){
      final routArgs =
      ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      title = routArgs['title']!;
      categoryId = routArgs['id']!;

      displayMeal = widget.avaibaleList.where((meal) {
        print(meal.title);
        return meal.categories.contains(categoryId);
      }).toList();

      loadFirstTime = true;

    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(title: Text(title)),
        drawer: const MainDrawer(),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              removeItem: removeItem,
              id: displayMeal[index].id,
              title: displayMeal[index].title,
              imageUrl: displayMeal[index].imageUrl,
              complexity: displayMeal[index].complexity,
              affordability: displayMeal[index].affordability,
              duration: displayMeal[index].duration,
            );
          },
          itemCount: displayMeal.length,
        ));
  }
}
