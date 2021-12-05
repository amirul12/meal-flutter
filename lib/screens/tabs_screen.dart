import 'package:flutter/material.dart';
import 'package:meal/screens/category_screen.dart';
import 'package:meal/screens/fovorities_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
       // initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(title: Text('Meals'),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.category), text: 'Categories',),
            Tab(icon: Icon(Icons.favorite), text: 'Favourite',)
          ]),),

          body: TabBarView(children: [
            CategoryScreen(),
            FavoritiesScreen()

          ]),
        ));
  }
}
