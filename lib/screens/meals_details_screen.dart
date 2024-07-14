import 'package:flutter/material.dart';
import 'package:meals_menu/models/meal.dart';

class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({
    super.key,
    required this.meal,
    required this.toggleFavouratemeals,
  });

  final Meal meal;
  final void Function(Meal meal) toggleFavouratemeals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                // print('pressed');
                toggleFavouratemeals(meal);
              },
              icon: const Icon(
                Icons.favorite_outline,
                size: 22,
              ))
        ],
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.only(bottom: 20, top: 10),
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 270,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Ingredients',
              textAlign: TextAlign.start,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final igd in meal.ingredients)
              Text(
                igd,
                textAlign: TextAlign.end,
                softWrap: true,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'Cooking steps',
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final step in meal.steps)
              Text(
                step,
                textAlign: TextAlign.center,
                softWrap: true,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
