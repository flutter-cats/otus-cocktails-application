import 'package:flutter/material.dart';

import '../../core/src/model/ingredient_definition.dart';
import 'cocktail_ingredient.dart';

class CocktailIngredients extends StatelessWidget {
  final Iterable<IngredientDefinition> ingredients;

  CocktailIngredients({required this.ingredients});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              Text('Ингредиенты:', style: TextStyle(color: Color(0xffb1afc6))),
              Column(children: _renderIngredients(ingredients)),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> _renderIngredients(Iterable<IngredientDefinition> ingredients) {
  return ingredients.map((element) => CocktailIngredient(
      ingredient: element
  )).toList();
}