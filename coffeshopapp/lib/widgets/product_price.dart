import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class ProductPrice extends StatelessWidget {
  final String priceName, units;
  final num value;
  const ProductPrice({
    @required this.units,
    @required this.value,
    @required this.priceName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveFlutter.of(context).scale(130),
      height: ResponsiveFlutter.of(context).verticalScale(40),
      decoration: BoxDecoration(
        color: Color(0xFF15151f),
        border: Border.all(
          color: Colors.transparent,
          width: 1,),
        borderRadius: BorderRadius.circular(14)
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$units$value ',
            style: TextStyle(
              fontSize: 26,
              fontFamily: 'MyriadPro',
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          Text(
            '$priceName',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'MyriadPro',
              fontWeight: FontWeight.normal,
              color: Color(0xFF9999a3),
            ),
          ),
        ],
      ),
    );
  }
}