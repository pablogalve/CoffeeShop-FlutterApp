import 'package:flutter/material.dart';
import '../app.dart';
import '../widgets/product_feature.dart';
import '../widgets/product_price.dart';

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
              Expanded(flex: 45, child: _Background()),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 485.0),
            child: _CoffeeInfo(coffee: coffee),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: _TotalOrder(),
          ),
        ],
      ),

    );
  }
}

class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0e0d13),
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 350,
      decoration: BoxDecoration(
        color: const Color(0xFF1f1e2c),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      padding: EdgeInsets.all(48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CoffeeName(name: coffee.name),
              SizedBox(height: 6),
              _CoffeeDescription(descr: coffee.description),
              SizedBox(height: 18),
              _CoffeeFeatures(features: coffee.features),
              SizedBox(height: 35),
              _CoffeePrice(prices: coffee.prices),   
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
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}

class _CoffeeDescription extends StatelessWidget {
  final String descr;
  _CoffeeDescription({this.descr});
  @override
  Widget build(BuildContext context) {
    return Text(
      descr,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 18,
      ),
    );
  }
}

class _CoffeeFeatures extends StatelessWidget {
  final List<Feature> features;
  _CoffeeFeatures({this.features});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 160.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var feature in features)
            ProductFeature(
              component: feature.component,
              units: feature.units,
              value: feature.value,
            ),
        ],
      ),
    );
  }
}

class _CoffeePrice extends StatelessWidget {
  final List<Price> prices;
  _CoffeePrice({this.prices});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var price in prices)
          ProductPrice(
            units: price.units,
            value: price.value,
            priceName: price.priceName,
          ),
      ],
    );
  }
}

class _TotalOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60.0 + 24,
      padding: EdgeInsets.only(right:40),
      child: Stack(
        children: [
            Center(
              child: Icon(
                Icons.local_drink,
                color: Colors.white,
              ),
            ),
        ]
      ),
    );
  }
}