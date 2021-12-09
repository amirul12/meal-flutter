import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = 'filter-screen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool lactoseFree = false;

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filter "),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection.",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchListTile("Gluten-free", "Only include gluten-free meals ", _glutenFree, (newVlue){
                  setState(() {
                    _glutenFree = newVlue;
                  });
                }),

                buildSwitchListTile("Vegetarian", "Only include vegetarian meals", _vegetarian, (value){
                  setState(() {
                    _vegetarian = value;
                  });
                }),

                buildSwitchListTile("Vargan", "only include Vargan meals", _vegan, (updateValue){
                  setState(() {
                    _vegan = updateValue;
                  });
                })


              ],
            )),
          ],
        ));
  }
}
