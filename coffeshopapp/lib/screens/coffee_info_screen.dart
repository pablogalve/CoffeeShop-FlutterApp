import 'package:flutter/material.dart';
import '../app.dart';
import '../widgets/product_feature.dart';
import '../widgets/product_price.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

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
              Expanded(flex: 79, child: _CoffeePreview(coffee: coffee)),
              Expanded(flex: 21, child: _TotalOrder()),
            ],
          ),
          Padding(
             padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.04,
                bottom: MediaQuery.of(context).size.height * 0.03),
            child: Align(
                alignment: Alignment.bottomRight,
                child: _PayButton(asset: coffee.masterCardLogo),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.04,
                bottom: MediaQuery.of(context).size.height * 0.03),
            child: Align(
                alignment: Alignment.centerRight,
                child: _Counter(),
            ),
          ),
        ],
      ),
    );
  }
}

class _CoffeePreview extends StatelessWidget {
  final Coffee coffee;
  _CoffeePreview({this.coffee});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget> [
          _CoffeePhoto(asset: coffee.photoUrl),
          _CoffeeInfo(coffee: coffee),
        ],
        )

    );
  }
}

class _CoffeePhoto extends StatelessWidget {
  final String asset;
  _CoffeePhoto({this.asset});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Image.asset(
        asset,
        height: MediaQuery.of(context).size.height / 2,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
            color: const Color(0xFF1f1e2c),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.1, //Left
            MediaQuery.of(context).size.height * 0.04, //Top
            MediaQuery.of(context).size.width * 0.1, //Right
            MediaQuery.of(context).size.height * 0.01), //Bottom
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            _CoffeeName(name: coffee.name),
            SizedBox(height: 5),
            _CoffeeDescription(descr: coffee.description),
            SizedBox(height: 20),
            _CoffeeFeatures(features: coffee.features),
            SizedBox(height: 22),
            _CoffeePrice(prices: coffee.prices),
          ]),
        ),
      ],
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
            fontSize: ResponsiveFlutter.of(context).fontSize(3),
            fontFamily: 'MyriadPro',
            fontWeight: FontWeight.w500,            
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
        color: Colors.white38,
        fontSize: ResponsiveFlutter.of(context).fontSize(2),
        fontFamily: 'MyriadPro',
        fontWeight: FontWeight.w300,
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
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              'Total Order',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'MyriadPro',
                fontWeight: FontWeight.normal,
                fontSize: ResponsiveFlutter.of(context).fontSize(3),
              ),
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
          Stack(
            children: [
              Center(
                child: Icon(
                  MdiIcons.glassCocktail,
                  color: Color(0xFF4d4b56),
                  size: 36,
                ),
              ),
              Align(
                alignment: Alignment(.3, -.9),
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xCC3e3b52),
                  ),
                  child: Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MyriadPro',
                        fontWeight: FontWeight.normal,
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                      ),
                    ),
                  ),
                )
              )
            ],
          ),
          Text(
            'Total Drinks',
            style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
              fontFamily: 'MyriadPro',
              fontWeight: FontWeight.w100,
              color: Colors.white38,
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
              fontSize: ResponsiveFlutter.of(context).fontSize(3),
              fontFamily: 'MyriadPro',
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            'Total Price',
            style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
              fontFamily: 'MyriadPro',
              fontWeight: FontWeight.w100,
              color: Colors.white38,
            ),
          ),
        ],
      ),
    );
  }
}

class _PayButton extends StatelessWidget {
   final String asset;
  _PayButton({this.asset});
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
          Image.asset(asset,
          width: 70),
          Text(
            'Pay',
            style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(2.8),
              color: Colors.white,
              fontFamily: 'MyriadPro',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  _Counter();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: Color(0xFF49465b),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget> [
            Container(
              alignment: Alignment.topCenter,
              width: 35.0,
              height: 35.0,
              decoration: new BoxDecoration(
              color: Color(0xFF312f3d),
              shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  MdiIcons.plus,
                  color: Colors.white
                  ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 35.0,
              height: 35.0,
              decoration: new BoxDecoration(
              color: Color(0xFF7c7797),
              shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '2',
                  style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                  fontFamily: 'MyriadPro',
                  fontWeight: FontWeight.normal,
                      ),
                    )
                  ),
              ),
            Container(
              alignment: Alignment.bottomCenter,
              width: 35.0,
              height: 35.0,
              decoration: new BoxDecoration(
               color: Color(0xFF312f3d),
              shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  MdiIcons.minus,
                  color: Colors.white
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
