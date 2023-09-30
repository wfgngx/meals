import 'package:flutter/material.dart';
import 'package:meals/Model/category.dart';

class CategoryGridItem extends StatelessWidget {
  Category category;
  final void Function() selectedCategory;
  CategoryGridItem(
      {super.key, required this.category, required this.selectedCategory});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectedCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(.9)
            ], end: Alignment.bottomRight, begin: Alignment.topLeft)),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
