import 'package:flutter/material.dart';

import 'screens/coffee_info_screen.dart';

class Feature {
  String component, units;
  num value;
  Feature(this.component, this.value, this.units);
}

class Coffee {
  String name;
  double price;
  List<Feature> features;
  String description;
  String photoUrl;
  Color color;
  Coffee(
    this.name,
    this.description,
    this.price,
    this.photoUrl,
    this.features,
    this.color,
  );
}

final mentaCocktail = Coffee(
  'Menta Cocktail',
  'Fresh Drink',
  8,
  'assets/images/coffee.png',
  [
    Feature('Fruit', 25, '%'),
    Feature('Water', 25, '%'),
    Feature('Milk', 25, '%'),
  ],
  Colors.transparent,
);

class CoffeeInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: CoffeeInfoScreen(
        coffee: mentaCocktail,
        
      ),
    );
  }
}