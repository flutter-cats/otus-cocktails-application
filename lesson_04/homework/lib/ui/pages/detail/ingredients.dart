import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:homework/models/res/app_colors.dart';
import 'package:homework/models/res/strings.dart';

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
      padding: const EdgeInsets.fromLTRB(32.0, 36.0, 24.0, 24.0),
      child: Column(
        children: [
          const Text(
            Strings.ingredients,
            style: TextStyle(
              fontSize: 16.0,
              color: AppColors.ingredients,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,
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
