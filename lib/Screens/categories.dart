import 'package:flutter/material.dart';
import 'package:meals/Model/category.dart';
import 'package:meals/Screens/meals.dart';
import 'package:meals/Widgets/category_grid_item.dart';

import '../Data/categories_data.dart';
import '../Model/maeal.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen(
      {required this.availableMeals,
      super.key,
      required this.onToggleFavorite});
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 600),
        lowerBound: 0,
        upperBound: 1);

    //Todo Tos start animation
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void selectedCategory(BuildContext context, Category category) {
    var filteredMeal = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MealsScreen(
                title: category.title,
                meals: filteredMeal,
                onToggleFavorite: widget.onToggleFavorite)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => Padding(
            padding:
                EdgeInsets.only(top: 100 - animationController.value * 100),child: child,),
        child: GridView(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 3 / 2),
            children:
                // categoriesList
                //     .map((category) => availableCategories(category: category))
                //     .toList(),
                [
              for (final category in availableCategories)
                CategoryGridItem(
                  category: category,
                  selectedCategory: () {
                    selectedCategory(context, category);
                  },
                )
            ]));
  }
}
