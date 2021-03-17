import 'package:flutter/material.dart';
import 'package:homework/custom_widgets/cocktail_details/CocktailIngredientItemWidget.dart';
import 'package:homework/models/src/model/cocktail.dart';
import 'package:homework/models/src/model/ingredient_definition.dart';
import 'package:homework/resources/Colors.dart';

class CocktailIngredientWidget extends StatelessWidget {
  const CocktailIngredientWidget(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      padding: EdgeInsets.only(top: 24, bottom: 16),
      child: Column(
        children: _getListOfIngredients(cocktail.ingredients),
      ),
    );
  }

  List<Widget> _getListOfIngredients(
      Iterable<IngredientDefinition> ingredients) {
    return List<Widget>()
      ..add(Center(
          child: Text(
        'Ингредиенты:',
        style: TextStyle(
            fontFamily: 'SF Pro Text',
            fontSize: 16,
            color: AppColors.cocktail_ingredient_title_color),
      )))
      ..addAll(ingredients.map((e) => CocktailIngredientItemWidget(e)));
  }
}
