import 'package:flutter/material.dart';

class CocktailDescriptionChipDecoration extends StatelessWidget {
  final double bottomMargin;
  final Widget child;

  const CocktailDescriptionChipDecoration({this.bottomMargin = 0, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      margin: EdgeInsets.only(bottom: bottomMargin),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.black),
      child: child,
    );
  }
}
