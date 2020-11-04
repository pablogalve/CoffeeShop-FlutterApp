import 'package:flutter/material.dart';

class ProductFeature extends StatelessWidget {
  final String component;
  final num value;
  final String units;
  const ProductFeature({
    @required this.component,
    @required this.value,
    @required this.units,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white70,
          width: 1,),
        borderRadius: BorderRadius.circular(10)

      ),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$value$units',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          Text(
            '$component',
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