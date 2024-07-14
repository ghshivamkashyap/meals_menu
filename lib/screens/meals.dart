import 'package:flutter/material.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meal,
    required this.toggleFavouratemeals,
  });

  final String title;
  final List<Meal> meal;
  final void Function(Meal meal) toggleFavouratemeals;

  @override
  Widget build(BuildContext context) {
    if (meal.isEmpty) {
      return const Scaffold(
        // appBar: AppBar(
        //   title: Text(title),
        // ),
        body: Center(
            child: Text(
          'No metching meals found...',
          style: TextStyle(color: Colors.white),
        )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: meal.length,
          itemBuilder: (ctx, idx) => MealItem(
                title: meal[idx].title,
                meal: meal[idx],
                toggleFavouratemeals: toggleFavouratemeals,
              )),
    );
  }
}
