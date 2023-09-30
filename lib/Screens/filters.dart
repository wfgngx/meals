import 'package:flutter/material.dart';

enum Filter { gluten, lactose, vegetarian, vegan }

class Filters extends StatefulWidget {
  const Filters({Key? key,required this.currentFilters}) : super(key: key);
  final Map<Filter,bool> currentFilters;

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var glutenCheck = false;
  var lactoseCheck = false;
  var vegetarianCheck = false;
  var veganCheck = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     glutenCheck = widget.currentFilters[Filter.gluten]!;
    lactoseCheck = widget.currentFilters[Filter.lactose]!;
    vegetarianCheck = widget.currentFilters[Filter.vegetarian]!;
    veganCheck = widget.currentFilters[Filter.vegan]!;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Filters"),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop({
              Filter.vegetarian: vegetarianCheck,
              Filter.gluten: glutenCheck,
              Filter.lactose: lactoseCheck,
              Filter.vegan: veganCheck
            });
            return false;
          },
          child: Column(
            children: [
              SwitchListTile(
                value: glutenCheck,
                onChanged: (isChecked) {
                  setState(() {
                    glutenCheck = isChecked;
                  });
                },
                title: Text(
                  "Gluten-free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  'Only include gluten-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: lactoseCheck,
                onChanged: (isChecked) {
                  setState(() {
                    lactoseCheck = isChecked;
                  });
                },
                title: Text(
                  "Lactose-free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  'Only include lactose-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: vegetarianCheck,
                onChanged: (isChecked) {
                  setState(() {
                    vegetarianCheck = isChecked;
                  });
                },
                title: Text(
                  "Vegetarian-free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  'Only include Vegetarian meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: veganCheck,
                onChanged: (isChecked) {
                  setState(() {
                    veganCheck = isChecked;
                  });
                },
                title: Text(
                  "Vegan-free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  'Only include Vegan meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
            ],
          ),
        ));
  }
}
