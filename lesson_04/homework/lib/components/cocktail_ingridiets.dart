import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:homework/models/src/model/ingredient_definition.dart';
import 'package:homework/text_styles.dart';

class CocktailIngredientsWidgets extends StatelessWidget {
  final Iterable<IngredientDefinition> allIngredients;

  const CocktailIngredientsWidgets({this.allIngredients});

  Widget _addIngredient(IngredientDefinition ingredient) => Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                ingredient.ingredientName,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            Flexible(
              child: Text(
                ingredient.measure,
                style: ingridientsTextStyle,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
      child: Column(
        children: [
          Container(
            child: Text(
              'Ингредиенты:',
              style: TextStyle(fontSize: 16.0, color: Color(0xFFB1AFC6)),
            ),
          ),
          ...allIngredients.map(_addIngredient),
        ],
      ),
    );
  }
}
