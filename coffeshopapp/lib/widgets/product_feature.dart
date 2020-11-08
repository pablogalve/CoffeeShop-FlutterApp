import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

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
      width: ResponsiveFlutter.of(context).scale(52),
      height: ResponsiveFlutter.of(context).verticalScale(50),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white24,
          width: 2,),
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
              fontFamily: 'MyriadPro',
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
          Text(
            '$component',
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'MyriadPro',
              fontWeight: FontWeight.w200,
              color: Colors.white38,
            ),
          ),
        ],
      ),
    );
  }
}