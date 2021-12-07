import 'package:flutter/material.dart';
import 'package:meal/screens/filter_screen.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function handler){
    return ListTile(
      leading: Icon(icon, size: 26,),
      title: Text(title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
      ),
      onTap: (){
        handler();
      },
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
          
          buildListTile("meals", Icons.restaurant, ()=>{
            Navigator.of(context).pushNamed('/')
          }),
          buildListTile("Filters", Icons.settings, ()=>{
            Navigator.of(context).pushNamed(FilterScreen.routeName)
          }),

        ],
      ),
    );
  }
}
