import 'package:flutter/material.dart';

import 'screens/coffee_info_screen.dart';

class Feature {
  String icon, units;
  num value;
  Feature(this.icon, this.units, this.value);
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
  'Melodi',
  'Reprehenderit sit excepteur aliquip sit laboris consequat pariatur aliquip in anim laboris.',
  15.99,
  'assets/images/coffee.png',
  [
    Feature('lamp', 'W', 22),
    Feature('hruler', 'cm', 28),
    Feature('vruler', 'cm', 26),
    Feature('plug', 'm', 1.6),
  ],
  Colors.amber,
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