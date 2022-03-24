import 'cocktail_category_item.dart';
import 'package:flutter/material.dart';

import '../../cocktail_filter_wrapper.dart';
import '../../core/models.dart';
import '../../res/app_dimens.dart';

class CocktailCategoryList extends StatelessWidget {
  const CocktailCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedType =
        StateInheritedWidget.of(context).selectedCocktailCategory;
    return Container(
      margin: AppDimensions.categoryContainerMargin,
      height: AppDimensions.categoryContainerHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: CocktailCategory.values.length,
        itemBuilder: (BuildContext context, int index) => CocktailCategoryItem(
            index: index, isSelected: selectedType == index),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: AppDimensions.categoryChipSpacing,
          );
        },
      ),
    );
  }
}
