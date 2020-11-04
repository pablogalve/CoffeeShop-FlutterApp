import 'package:flutter/material.dart';
import '../app.dart';
import '../widgets/product_feature.dart';
import '../widgets/product_price.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


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
              Expanded(flex: 46, child: _CoffeePhoto(asset: coffee.photoUrl)),
              Expanded(flex: 33, child: _CoffeeInfo(coffee: coffee)),
              Expanded(flex: 21, child: _TotalOrder()),
            ],
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
      decoration: BoxDecoration(
        color: const Color(0xFF1f1e2c),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      padding: EdgeInsets.all(38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CoffeeName(name: coffee.name),
              SizedBox(height: 5),
              _CoffeeDescription(descr: coffee.description),
              SizedBox(height: 15),
              _CoffeeFeatures(features: coffee.features),
              SizedBox(height: 18),
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
            fontSize: 32,
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
      padding: EdgeInsets.all(38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
                'Total Order',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
          SizedBox(height: 20),
          _TotalInfo(),
           SizedBox(height: 2),
        ],
      ),
    );
  }
}


class _TotalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 180.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _TotalDrinksIcon(),
          _TotalPriceIcon(),
        ],
      ),
    );
  }
}

class _TotalDrinksIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 70,
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(MdiIcons.glassCocktail, color: Colors.white,),
          Text(
            'Total Drinks',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w100,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class _TotalPriceIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 70,
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '32\$',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Total Price',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w100,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}