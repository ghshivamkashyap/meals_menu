import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onDrawerTap});

  final void Function(String s) onDrawerTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 19, 106, 146),
                Color.fromARGB(255, 12, 128, 72)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            padding: EdgeInsets.all(17),
            child: Row(
              children: [
                Icon(Icons.fastfood),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking Up.',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onDrawerTap('meals');
            },
            leading: const Icon(Icons.restaurant),
            title: const Text('Meals'),
          ),
          ListTile(
            onTap: () {
              onDrawerTap('filters');
            },
            leading: const Icon(Icons.settings),
            title: const Text('Filters'),
          )
        ],
      ),
    );
  }
}
