import 'package:flutter/material.dart';

import '../../cocktail_filter_wrapper.dart';
import '../../core/models.dart';
import '../../res/app_colors.dart';
import '../../res/app_dimens.dart';
import '../../res/app_styles.dart';

class CocktailCategoryItem extends StatefulWidget {
  const CocktailCategoryItem(
      {Key? key, required this.index, required this.isSelected})
      : super(key: key);

  final bool isSelected;
  final int index;

  @override
  State<CocktailCategoryItem> createState() => _CocktailCategoryItemState();
}

class _CocktailCategoryItemState extends State<CocktailCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      padding: AppDimensions.cocktailTypeChipPadding,
      disabledColor: AppColors.categoryChipDisabledColor,
      selectedColor: AppColors.categoryChipSelectedColor,
      label: Text(
        CocktailCategory.values.elementAt(widget.index).value,
        style: AppStyles.categoryChipTextStyle,
      ),
      selected: widget.isSelected,
      onSelected: (selected) {
        StateInheritedWidget.of(context).setCocktailCategory(widget.index);
      },
    );
  }
}
