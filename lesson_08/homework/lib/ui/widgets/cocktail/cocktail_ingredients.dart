import 'package:flutter/material.dart';
import 'package:cocktail/style/style.dart';
import 'package:cocktail/core/models.dart';

class CocktailIngredients extends StatelessWidget {
  const CocktailIngredients({
    Key key,
    @required this.ingredients,
  }) : super(key: key);

  final List<IngredientDefinition> ingredients;
  final String ingredientTitle = 'Ингредиенты:';

  @override
  Widget build(BuildContext context) {
    List<Widget> ingredientsWidgets = ingredients
        .map((ingraient) => _buildIngredient(
              context,
              name: ingraient.ingredientName,
              measure: ingraient.measure,
            ))
        .toList();

    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.fromLTRB(36, 24, 36, 24),
      child: Column(
        children: [
          Container(
            child: Text(
              ingredientTitle,
              style: AppTextStyle.secondaryTitle,
            ),
            padding: EdgeInsets.only(
              bottom: 24,
            ),
          ),
          ...ingredientsWidgets,
        ],
      ),
    );
  }

  Widget _buildIngredient(BuildContext context, {name, measure}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: AppTextStyle.primaryText.copyWith(
            height: 2,
            decoration: TextDecoration.underline,
          ),
        ),
        Text(
          measure,
          style: AppTextStyle.primaryText.copyWith(
            height: 2,
          ),
        ),
      ],
    );
  }
}
