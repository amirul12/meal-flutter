import 'package:flutter/material.dart';
import 'package:meal/meal.dart';
import 'package:meal/screens/category_screen.dart';
import 'package:meal/screens/fovorities_screen.dart';
import 'package:meal/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeal;

  TabsScreen( {required this.favoriteMeal});


  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

   List<Map<String, dynamic>> _pages =[];


  int _selectedPageIndex = 0;

  @override
  void initState() {

    _pages = [
      {'page':CategoryScreen(), 'title':'Categories'},
      {'page':FavoritiesScreen(favoriteMeal: widget.favoriteMeal,), 'title' : 'Favorite'}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,

        // type: BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text("Category")),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              title: Text("Favorite")),
        ],
      ),
    );
  }
}
