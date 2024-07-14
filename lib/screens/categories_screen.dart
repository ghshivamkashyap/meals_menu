import 'package:flutter/material.dart';
import 'package:meals_menu/data/dummy_data.dart';
import 'package:meals_menu/models/category.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/screens/meals.dart';
import 'package:meals_menu/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.toggleFavouratemeals});
  final void Function(Meal meal) toggleFavouratemeals;

  void _ontap(BuildContext context, Category c) {
    final filteredMeals =
        dummyMeals.where((item) => item.categories.contains(c.id)).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
            title: c.title,
            meal: filteredMeals,
            toggleFavouratemeals: toggleFavouratemeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
        children: [
          for (final c in availableCategories)
            CategoryGridItem(
              cat: c,
              onTap: () {
                _ontap(context, c);
              },
            )
        ],
      ),
    );
  }
}
