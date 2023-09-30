import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/Screens/categories.dart';
import 'package:meals/Screens/meals.dart';
import 'package:meals/Screens/tabs.dart';

import 'Data/categories_data.dart';



final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    brightness: Brightness.dark,

  ),
  textTheme: GoogleFonts.latoTextTheme()

);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home:   Tabs(),
    );
  }

}

