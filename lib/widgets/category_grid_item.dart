import 'package:flutter/material.dart';
import 'package:meals_menu/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.cat,
    required this.onTap,
  });

  final Category cat;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [cat.color.withOpacity(0.4), cat.color.withOpacity(1)],
          ),
        ),
        child: Text(
          cat.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
