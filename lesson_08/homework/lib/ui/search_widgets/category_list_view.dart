import 'package:cocktail/core/src/model/cocktail_category.dart';
import 'package:cocktail/ui/search_widgets/res/consts.dart';
import 'package:flutter/material.dart';

Widget getCategoryItem(
    CocktailCategory category, bool isActive, dynamic triggerSetState) {
  return GestureDetector(
    onTap: () => triggerSetState(),
    child: Container(
      margin: EdgeInsets.all(6),
      height: 46,
      padding: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: isActive
            ? activeCategoryContainerColor
            : notActiveCategoryContainerColor,
        border: Border.all(
          color: borderColor,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        category.value,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    ),
  );
}
