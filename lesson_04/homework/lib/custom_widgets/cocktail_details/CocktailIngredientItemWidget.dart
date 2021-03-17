import 'package:flutter/material.dart';
import 'package:homework/models/src/model/ingredient_definition.dart';
import 'package:homework/resources/Colors.dart';

class CocktailIngredientItemWidget extends StatelessWidget {
  const CocktailIngredientItemWidget(this.ingredient, {
    Key key,
  }) : super(key: key);

  final IngredientDefinition ingredient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 32, right: 36, top: 8, bottom: 8),
      child: Row(
        children: [
          Text(ingredient.ingredientName,
            style: TextStyle(
                fontFamily: 'SF Pro Text',
                fontSize: 14,
                color: AppColors.white,
                decoration: TextDecoration.underline
            )
          ),
          Spacer(),
          Text(ingredient.measure,
          style: TextStyle(
              fontFamily: 'SF Pro Text',
              fontSize: 14,
              color: AppColors.white
          ),)
        ],
      ),
    );
  }

}