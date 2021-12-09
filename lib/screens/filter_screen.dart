import 'package:flutter/material.dart';
import 'package:meal/meal.dart';
import 'package:meal/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = 'filter-screen';

  final Function saveFilterData;
  final Map<String, bool> currentFilter;

  FilterScreen({required this.saveFilterData, required this.currentFilter});


  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){

   _glutenFree =  widget.currentFilter['gluten']!;
   _vegetarian = widget.currentFilter['vegetarian']!;
   _vegan = widget.currentFilter['vegan']!;
   _lactoseFree = widget.currentFilter['lactose']!;

    super.initState();
  }


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
      drawer: MainDrawer(),
        appBar: AppBar(
          title: Text("Filter "),
          actions: [
            IconButton(onPressed:(){
             final  selectFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,};
              widget.saveFilterData(selectFilter);


             // Navigator.of(context).pop();
              }
            , icon: Icon(Icons.save)),
          ],
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
                buildSwitchListTile("Lactose", "Only include Lactose meals", _lactoseFree, (value){
                  setState(() {
                    _lactoseFree = value;
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
