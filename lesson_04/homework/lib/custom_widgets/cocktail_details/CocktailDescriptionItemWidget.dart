import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:homework/resources/Colors.dart';

class CocktailDescriptionItemWidget extends StatelessWidget {
  const CocktailDescriptionItemWidget(
    this.title,
    this.cocktailCharacteristic, {
    Key key,
  }) : super(key: key);

  final String title;
  final String cocktailCharacteristic;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 14,
                  color: AppColors.cocktail_properties_title_color),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
                color: AppColors.cocktail_item_description_background,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
              child: Text(
                cocktailCharacteristic,
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 15,
                    color: AppColors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
