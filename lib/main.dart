import 'package:flutter/material.dart';
import 'package:mon_premier_app/presentation/screens/home_screen.dart';
import 'package:mon_premier_app/presentation/screens/recipe_screen.dart'; 


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //This Widget is the root of our application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home:  const RecipeScreen(),
    );
  }
}


