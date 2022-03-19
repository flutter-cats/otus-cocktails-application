import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:homework/models/res/app_strings.dart';
import '../../../models/res/app_dimens.dart';
import '../../../models/res/app_styles.dart';
import 'ingredient_item.dart';

class IngredientsWidget extends StatelessWidget {
  const IngredientsWidget({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  final Iterable<IngredientDefinition> ingredients;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimensions.ingredientsWidgetPadding,
      child: Column(
        children: [
          const Text(
            AppStrings.ingredients,
            style: AppStyles.ingredientsTextStyle,
          ),
          const SizedBox(
            height: AppDimensions.ingredientsListTopPadding,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
              height: AppDimensions.listSeparatorHeight,
            ),
            shrinkWrap: true,
            itemCount: ingredients.length,
            itemBuilder: (BuildContext context, int index) {
              return IngredientItem(
                ingredientName: ingredients.elementAt(index).ingredientName,
                ingredientMeasure: ingredients.elementAt(index).measure,
              );
            },
          ),
        ],
      ),
    );
  }
}
