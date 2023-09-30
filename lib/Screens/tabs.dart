import 'package:flutter/material.dart';
import 'package:meals/Data/categories_data.dart';
import 'package:meals/Screens/categories.dart';
import 'package:meals/Screens/meals.dart';
import 'package:meals/Widgets/my_drawer.dart';

import '../Model/maeal.dart';
import 'filters.dart';

const kInitialFilters = {
  Filter.vegan: false,
  Filter.vegetarian: false,
  Filter.lactose: false,
  Filter.gluten: false,
};

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  Map<Filter, bool> selectedFilters = kInitialFilters;
  int index = 0;
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      var result = await Navigator.push<Map<Filter, bool>>(
          context, MaterialPageRoute(builder: (ctx) =>  Filters(currentFilters:selectedFilters,)));
      setState(() {
        selectedFilters = result ?? kInitialFilters;
      });
    }
    // else{
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoriesScreen(onToggleFavorite: toggleFavoriteStatus)));
    // }
  }

  final List<Meal> favoriteMeals = [];
  void toggleFavoriteStatus(Meal meal) {
    final isExisting = favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        favoriteMeals.remove(meal);
        showSnackBar('Meal is no longer a favorite.');
      });
    } else {
      setState(() {
        favoriteMeals.add(meal);
        showSnackBar('Marked as a favorite!');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final avilableMeals = dummyMeals.where((meal) {
      if (selectedFilters[Filter.gluten]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filter.lactose]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    List<Widget> tabsScreen = [
      CategoriesScreen(
        onToggleFavorite: toggleFavoriteStatus,
        availableMeals: avilableMeals,
      ),
      MealsScreen(meals: favoriteMeals, onToggleFavorite: toggleFavoriteStatus)
    ];
    return Scaffold(
      drawer: My_Drawer(selectedItemInDtawer: setScreen),
      appBar: AppBar(
        title: index == 0
            ? const Text("Categories")
            : const Text('Your favorites'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (inx) {
            index = inx;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
          ]),
      body: tabsScreen[index],
    );
  }
}
