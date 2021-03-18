import 'package:flutter/material.dart';
import 'package:homework/models/src/model/ingredient_definition.dart';
import 'package:homework/text_styles.dart';

class CoctailIngridientsWidgets extends StatelessWidget {
  final Iterable<IngredientDefinition> allIngridients;

  const CoctailIngridientsWidgets({this.allIngridients});

  Widget _addingredientList(Iterable<IngredientDefinition> ingredients) {
    List<Container> list = [];

    for (var ingredient in ingredients) {
      Container row = Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ingredient.ingredientName,
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            Text(
              ingredient.measure,
              style: ingridientsTextStyle,
            ),
          ],
        ),
      );

      list.add(row);
    }

    return Column(
      children: list,
    );
  }

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
          _addingredientList(allIngridients)
        ],
      ),
    );
  }
}
