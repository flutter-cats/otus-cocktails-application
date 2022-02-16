import 'package:flutter/material.dart';

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
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Text(
          ingredientMeasure,
        )
      ],
    );
  }
}
