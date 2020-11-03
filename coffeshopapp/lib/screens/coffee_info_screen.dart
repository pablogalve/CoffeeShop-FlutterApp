import 'package:flutter/material.dart';
import '../app.dart';

class CoffeeInfoScreen extends StatelessWidget {
  final Coffee coffee;
  CoffeeInfoScreen({@required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(flex: 55, child: _CoffeePhoto(asset: coffee.photoUrl)),
              Expanded(flex: 45, child: _CoffeeInfo(coffee: coffee)),
            ],
          ),
        ],
      ),
    );
  }
}

class _CoffeePhoto extends StatelessWidget {
  final String asset;
  _CoffeePhoto({this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        asset,
        width: 500,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _CoffeeInfo extends StatelessWidget {
  final Coffee coffee;
  _CoffeeInfo({this.coffee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _CoffeeName(name: coffee.name),
        ]
      ),
    );
  }
}

class _CoffeeName extends StatelessWidget {
  final String name;
  _CoffeeName({this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
