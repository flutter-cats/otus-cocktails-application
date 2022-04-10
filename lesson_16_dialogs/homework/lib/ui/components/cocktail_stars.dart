import 'package:flutter/material.dart';
import 'package:homework/ui/constants.dart';

import 'round_star.dart';

class CocktailStars extends StatelessWidget{
  final int rating;
  CocktailStars({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _renderStars(rating),
        ),
      ),
    );
  }
}

List<Widget> _renderStars(int rating) {
  List<Widget> result = [];
  for (int i = 1; i <= 5; i++) {
    result.add(
      RoundStar(
        checked: i <= rating,
      )
    );
  }
  return result;
}