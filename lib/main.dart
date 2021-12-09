import 'package:flutter/material.dart';
import 'package:meal/screens/category_meal_screen.dart';
import 'package:meal/screens/filter_screen.dart';
import 'package:meal/screens/meal_details_screen.dart';
import 'package:meal/screens/tabs_screen.dart';

import 'dummy_data.dart';
import 'meal.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  final List<Meal> _availableMeal = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {

    setState(() {
      _filter = filterData;

      print('main class');
      print(filterData['gluten']);
      print(filterData['lactose']);
      print(filterData['vegan']);
      print(filterData['vegetarian']);
      print('end');
      _availableMeal.where((meal){

        print(meal.title);

        // if(_filter['gluten']! && !meal.isGlutenFree){
        //   print("in gluten");
        //   return false;
        // }
        //
        // if(_filter['lactose']! && !meal.isLactoseFree){
        //   print("in lactose");
        //   return false;
        // }
        // if(_filter['vegan']! && !meal.isVegan){
        //   print("in vegan");
        //   return false;
        // }
        if(_filter['vegetarian']! && !meal.isVegetarian){
          print("in vegetarian");
          return false;
        }
        return true;

      }).toList();

    });


  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.pink,
          canvasColor: const Color.fromRGBO(225, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              subtitle1: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      // home: const CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealScreen.routeName: (ctx) =>  CategoryMealScreen(avaibaleList: _availableMeal),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(
              saveFilterData: _setFilters, currentFilter: _filter,
            ),
      },

      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: const Center(
        child: CategoryScreen(),
      ),
    );
  }
}
