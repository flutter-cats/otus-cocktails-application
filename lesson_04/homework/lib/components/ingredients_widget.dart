import 'package:flutter/material.dart';
import 'package:homework_4/models/models.dart';
import 'package:homework_4/models/src/model/ingredient_definition.dart';
import 'package:homework_4/style/text_style.dart';

class IngredientsWidgets extends StatelessWidget {
  final Iterable<IngredientDefinition> allIngredients;

  const IngredientsWidgets({this.allIngredients});

  Widget _addIngredient(IngredientDefinition ingredient) => Container(
    padding: EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            ingredient.ingredientName,
            style: ingridientsItemStyle,
          ),
        ),
        Flexible(
          child: Text(
            ingredient.measure,
            style: ingridientsValueStyle,
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
              style: ingridientTitleStyle,
            ),
          ),
          ...allIngredients.map(_addIngredient),
        ],
      ),
    );
  }
}
