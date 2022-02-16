import 'package:flutter/material.dart';

import 'models/src/model/cocktail.dart';
import 'models/src/model/ingredient_definition.dart';
import 'styles.dart';

class CocktailIngredientsSection extends StatelessWidget {
  const CocktailIngredientsSection(
      this.cocktail, {
        Key key,
      }) : super(key: key);

  final Cocktail cocktail;

  Widget ingredientsRow(IngredientDefinition ingredientDefinition) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ingredientDefinition.ingredientName,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            ingredientDefinition.measure,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget ingredientsList() {
    return Column(
      children: cocktail.ingredients.map((element) {
        return ingredientsRow(element);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: primaryBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          children: [
            Text(
              "Ингредиенты:",
              style: TextStyle(
                fontSize: 16.0,
                color: primaryTextColor,
              ),
            ),
            ingredientsList(),
          ],
        ),
      ),
    );
  }
}
