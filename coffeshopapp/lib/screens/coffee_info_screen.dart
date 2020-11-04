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
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.01),
            child: Align(
              alignment: Alignment.bottomRight,
              child: _PayButton(),
            ),
          )
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
        width: MediaQuery.of(context).size.width,
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
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.1, //Left
        MediaQuery.of(context).size.height * 0.02, //Top
        MediaQuery.of(context).size.width * 0.1, //Right
        MediaQuery.of(context).size.height * 0.01), //Bottom
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _CoffeeName(name: coffee.name),
        SizedBox(height: 5),
        _CoffeeDescription(descr: coffee.description),
        SizedBox(height: 15),
        _CoffeeFeatures(features: coffee.features),
        SizedBox(height: 18),
        _CoffeePrice(prices: coffee.prices),
      ]),
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
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
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
        fontSize: 15.0,
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
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Total Order',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 10),
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
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.1,
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            MdiIcons.glassCocktail,
            color: Colors.white,
          ),
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
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.1,
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '32\$',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
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

class _PayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: Color(0xFF49465b),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            MdiIcons.creditCard,
            color: Colors.white,
          ),
          Text(
            'Pay',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
