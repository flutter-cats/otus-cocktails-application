import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';

import 'package:homework/themes/app_text_theme.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({
    Key key,
    @required this.cocktail,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 32.0,
      ),
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Ингредиенты:',
            style: AppTextTheme.body1.copyWith(
              color: const Color(0xFFB1AFC6),
            ),
          ),
          ...cocktail.ingredients
              .map((element) => IngredientItem(ingredient: element)),
        ],
      ),
    );
  }
}

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    Key key,
    @required this.ingredient,
  }) : super(key: key);

  final IngredientDefinition ingredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Text(
              ingredient.ingredientName,
              style: AppTextTheme.body2.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Flexible(
            child: Text(
              ingredient.measure,
              style: AppTextTheme.body2.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
