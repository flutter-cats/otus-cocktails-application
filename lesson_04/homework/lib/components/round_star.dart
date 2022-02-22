import 'package:flutter/material.dart';

class RoundStar extends StatelessWidget {
  final bool checked;

  RoundStar({this.checked});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Color unmatched = Color(0xff1a1927);
    Color matched = Colors.white;
    double dimension = screenWidth / 5 - 15;
    double starSize = dimension - 10;
    return Container(
      width: dimension,
        height: dimension,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color(0xff2a293a),
        ),
        child:
            Icon(
                Icons.star,
                color: checked ? matched : unmatched,
              size: starSize,
            ));
  }
}
