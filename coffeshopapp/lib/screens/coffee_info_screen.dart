import 'package:flutter/material.dart';
import '../app.dart';

class CoffeeInfoScreen extends StatelessWidget {
  final Coffee coffee;
  CoffeeInfoScreen({@required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(flex: 5, child: _CoffeePreview(coffee: coffee)),
            ],
          ),
        ],
      ),
    );
  }
}

class _CoffeePreview extends StatelessWidget {
  final Coffee coffee;
  _CoffeePreview({@required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          _CoffeePhoto(asset: coffee.photoUrl), 
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
      width: 500,
      child: Image.asset(asset),
    );
  }
}
