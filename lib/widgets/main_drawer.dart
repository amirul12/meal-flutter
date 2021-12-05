import 'package:flutter/material.dart';
class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData icon){
    return ListTile(
      leading: Icon(icon, size: 26,),
      title: Text(title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.amber,
            child: Text("Cooking Uo !",
            style: TextStyle(fontWeight: FontWeight.w900,
            fontSize: 30,
            color: Theme.of(context).primaryColor),),
          ),
          SizedBox(
            height: 20,
          ),
          
          buildListTile("meals", Icons.restaurant),
          buildListTile("Filters", Icons.settings),

        ],
      ),
    );
  }
}
