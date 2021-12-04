import 'package:flutter/material.dart';
import 'package:meal/screens/category_meal_screen.dart';
import 'package:meal/screens/meal_details_screen.dart';

import 'screens/category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
          bodyText1: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          bodyText2: const TextStyle(
            color:  Color.fromRGBO(20, 51, 51, 1)
          ),
          subtitle1: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          )
        )

      ),
      // home: const CategoryScreen(),
      initialRoute: '/',
      routes:{
        '/': (ctx)=> CategoryScreen(),
        CategoryMealScreen.routeName:(ctx)=> const CategoryMealScreen(),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
      } ,

      onGenerateRoute: (settings){
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


