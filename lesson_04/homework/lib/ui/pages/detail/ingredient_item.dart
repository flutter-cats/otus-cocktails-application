import 'package:flutter/material.dart';

import '../../../models/res/app_styles.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem(
      {Key? key, required this.ingredientName, required this.ingredientMeasure})
      : super(key: key);

  final String ingredientName;
  final String ingredientMeasure;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            ingredientName,
            style: AppStyles.ingredientNameTextStyle,
          ),
        ),
        Text(
          ingredientMeasure,
        )
      ],
    );
  }
}
