import 'package:flutter/material.dart';

import '../../core/src/model/ingredient_definition.dart';

class CocktailIngredient extends StatelessWidget {
  final IngredientDefinition ingredient;

  CocktailIngredient({required this.ingredient});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(ingredient.ingredientName, style: TextStyle(decoration: TextDecoration.underline)),
          Text(ingredient.measure)
        ],
      ),
    );
  }
}