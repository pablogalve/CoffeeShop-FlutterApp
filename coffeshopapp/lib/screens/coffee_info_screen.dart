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
              right: ResponsiveFlutter.of(context).moderateScale(15),
              bottom: ResponsiveFlutter.of(context).moderateScale(10),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: _PayButton(asset: coffee.masterCardLogo),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: ResponsiveFlutter.of(context).moderateScale(15),
                bottom: ResponsiveFlutter.of(context).moderateScale(10)),
            child: Align(
              alignment: Alignment.centerRight,
              child: _Counter(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: ResponsiveFlutter.of(context).moderateScale(15),
                bottom: ResponsiveFlutter.of(context).moderateScale(10)),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: _TotalInfo(),
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
      children: <Widget>[
        _CoffeePhoto(asset: coffee.photoUrl),
        _CoffeeInfo(coffee: coffee),
      ],
    ));
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
        height: MediaQuery.of(context).size.height * 0.5,
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
          height: ResponsiveFlutter.of(context).verticalScale(212),
          decoration: BoxDecoration(
            color: const Color(0xFF1f1e2c),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          padding: EdgeInsets.fromLTRB(
            ResponsiveFlutter.of(context).moderateScale(20), //Left
            ResponsiveFlutter.of(context).moderateScale(20), //Top
            ResponsiveFlutter.of(context).moderateScale(20), //Right
            ResponsiveFlutter.of(context).moderateScale(5), //Bottom
          ), //Bottom
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            _CoffeeName(name: coffee.name),
            SizedBox(height: ResponsiveFlutter.of(context).verticalScale(4)),
            _CoffeeDescription(descr: coffee.description),
            SizedBox(height: ResponsiveFlutter.of(context).verticalScale(15)),
            _CoffeeFeatures(features: coffee.features),
            SizedBox(height: ResponsiveFlutter.of(context).verticalScale(18)),
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
      padding: EdgeInsets.only(
          right: ResponsiveFlutter.of(context).moderateScale(140)),
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
    return Padding(
      padding: EdgeInsets.only(
          right: ResponsiveFlutter.of(context).moderateScale(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var price in prices)
            ProductPrice(
              units: price.units,
              value: price.value,
              priceName: price.priceName,
            ),
        ],
      ),
    );
  }
}

class _TotalOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveFlutter.of(context).verticalScale(50),
      padding: EdgeInsets.fromLTRB(
          ResponsiveFlutter.of(context).moderateScale(15),
          ResponsiveFlutter.of(context).moderateScale(10),
          ResponsiveFlutter.of(context).moderateScale(10),
          ResponsiveFlutter.of(context).moderateScale(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: ResponsiveFlutter.of(context).moderateScale(15)),
            child: Text(
              'Total Order',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'MyriadPro',
                fontWeight: FontWeight.normal,
                fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TotalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: ResponsiveFlutter.of(context).moderateScale(140)),
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
      width: ResponsiveFlutter.of(context).scale(90),
      height: ResponsiveFlutter.of(context).verticalScale(70),
      padding: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Center(
                child: Icon(
                  MdiIcons.glassCocktail,
                  color: Color(0xFF4d4b56),
                  size: ResponsiveFlutter.of(context).scale(28),
                ),
              ),
              Align(
                  alignment: Alignment(.3, -.9),
                  child: Container(
                    width: ResponsiveFlutter.of(context).scale(22),
                    height: ResponsiveFlutter.of(context).scale(15),
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
                  ))
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
      width: ResponsiveFlutter.of(context).scale(90),
      height: ResponsiveFlutter.of(context).verticalScale(70),
      padding: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(8)),
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
      width: ResponsiveFlutter.of(context).scale(70),
      height: ResponsiveFlutter.of(context).verticalScale(130),
      decoration: BoxDecoration(
        color: Color(0xFF49465b),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(asset, width: ResponsiveFlutter.of(context).scale(60)),
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
      width: ResponsiveFlutter.of(context).scale(70),
      height: ResponsiveFlutter.of(context).verticalScale(140),
      decoration: BoxDecoration(
        color: Color(0xFF49465b),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          ResponsiveFlutter.of(context).moderateScale(10),
          ResponsiveFlutter.of(context).moderateScale(10),
          ResponsiveFlutter.of(context).moderateScale(10),
          ResponsiveFlutter.of(context).moderateScale(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              width: ResponsiveFlutter.of(context).scale(35),
              height: ResponsiveFlutter.of(context).verticalScale(35),
              decoration: new BoxDecoration(
                color: Color(0xFF312f3d),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  MdiIcons.plus,
                  color: Colors.white,
                  size: ResponsiveFlutter.of(context).scale(20),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: ResponsiveFlutter.of(context).scale(35),
              height: ResponsiveFlutter.of(context).verticalScale(35),
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
              )),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: ResponsiveFlutter.of(context).scale(35),
              height: ResponsiveFlutter.of(context).verticalScale(35),
              decoration: new BoxDecoration(
                color: Color(0xFF312f3d),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  MdiIcons.minus,
                  color: Colors.white,
                  size: ResponsiveFlutter.of(context).scale(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
