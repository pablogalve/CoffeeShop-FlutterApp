import 'package:flutter/material.dart';

import 'screens/coffee_info_screen.dart';

class Feature {
  String component, units;
  num value;
  Feature(this.component, this.value, this.units);
}

class Price {
  num value;
  String priceName, units;
  Price(this.units, this.value, this.priceName);
}

class Coffee {
  String name;
  double price;
  List<Feature> features;
  List<Price> prices;
  String description;
  String photoUrl;
  Color color;
  Coffee(
    this.name,
    this.description,
    this.price,
    this.photoUrl,
    this.features,
    this.prices,
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
  [
    Price('\$', 8, 'Price x Drink'),
    Price('\$', 8, 'Total Price'),
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
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white)
      ),
      home: CoffeeInfoScreen(
        coffee: mentaCocktail,
        
      ),
    );
  }
}