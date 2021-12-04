import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  Widget buildSelectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSelectionTitle(context, "Ingrdients"),

              buildContainer(ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      margin: EdgeInsets.all(5),
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }),),
              buildSelectionTitle(context, "Steps"),
              buildContainer(ListView.builder(
                itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index){
                  return Column(
                    children: [
                  ListTile(
                  leading: CircleAvatar(
                  child: Text('# ${index + 1}'),
                    ),
                    title: Text(selectedMeal.steps[index], style: TextStyle(fontWeight: FontWeight.w400),),
                    ),
                      Divider(),
                    ],
                  );

              }))
            ],
          ),
        ));
  }
}
