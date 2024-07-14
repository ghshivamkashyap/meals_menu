import 'package:flutter/material.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/screens/categories_screen.dart';
import 'package:meals_menu/screens/meals.dart';
import 'package:meals_menu/widgets/custom_drawer.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  final List<Meal> _favouratesMeals = [];
  void _updateFavouratesmeals(Meal m) {
    // print('toggle called//////////////////////////');
    if (_favouratesMeals.contains(m)) {
      setState(() {
        _favouratesMeals.remove(m);
      });
    } else {
      setState(() {
        _favouratesMeals.add(m);
      });
    }
  }

  void _setScreen(String s) {
    if (s == 'filters') {
      print('filters');
    } else {
      Navigator.of(context).pop();
      print('meals');
    }
  }

  int _currState = 0;
  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      toggleFavouratemeals: _updateFavouratesmeals,
    );
    var pageTitle = const Text('Categories');
    if (_currState == 1) {
      activePage = MealsScreen(
        title: 'Favourates',
        meal: _favouratesMeals,
        toggleFavouratemeals: _updateFavouratesmeals,
      );
      pageTitle = const Text('Your Favourates');
    }

    return Scaffold(
      appBar: AppBar(
        title: pageTitle,
      ),
      drawer: CustomDrawer(
        onDrawerTap: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currState,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessible_forward_outlined),
              label: 'Favourates')
        ],
        onTap: (idx) {
          setState(() {
            _currState = idx;
          });
        },
      ),
    );
  }
}
