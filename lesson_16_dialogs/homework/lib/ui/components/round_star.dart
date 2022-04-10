import 'package:flutter/material.dart';
import 'package:homework/ui/constants.dart';

class RoundStar extends StatelessWidget {
  final bool checked;

  RoundStar({required this.checked});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Color unmatched = Constants.backgroundColor;
    Color matched = Colors.white;
    double dimension = screenWidth / 5 - 15;
    double starSize = dimension - 10;
    return Container(
      width: dimension,
        height: dimension,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Constants.starBackgroundColor,
        ),
        child:
            Icon(
                Icons.star,
                color: checked ? matched : unmatched,
              size: starSize,
            ));
  }
}
