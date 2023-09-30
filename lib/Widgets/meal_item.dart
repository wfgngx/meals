import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/Model/maeal.dart';
import 'package:meals/Screens/meal_details_screen.dart';
import 'package:meals/Widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  MealItem({super.key, required this.meal, required this.onToggleFavorite});
  Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  // void Function(Meal meal) onSelectedMeal;
  String get mealComplexity {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get mealAffordability {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
          onTap: () {
            // onSelectedMeal(meal);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MealDetailsScreen(
                          meal: meal, onToggleFavorite: onToggleFavorite,

                        )));
          },
          child: Stack(
            children: [
             Hero(
               tag: meal.id,
               child:
              FadeInImage(
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl))),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 44),
                      color: Colors.black54,
                      child: Column(children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          // softWrap: true,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemTrait(
                                icon: Icons.timer_sharp,
                                label: '${meal.duration} min'),
                            const SizedBox(
                              width: 12,
                            ),
                            MealItemTrait(
                                icon: Icons.work, label: mealComplexity),
                            const SizedBox(
                              width: 12,
                            ),
                            MealItemTrait(
                                icon: Icons.attach_money,
                                label: mealAffordability)
                          ],
                        )
                      ])))
            ],
          )),
    );
  }
}
