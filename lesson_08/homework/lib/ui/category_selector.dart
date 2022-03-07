import 'package:cocktail/core/models.dart';
import 'package:flutter/material.dart';

import 'components/category_check_tag.dart';

class CategorySelector extends StatelessWidget {
  late final CocktailCategory category;
  late final void Function(CocktailCategory category) onChanged;

  CategorySelector({
    required this.category,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: CocktailCategory.values.map((element) =>
        CategoryCheckTag(
            isChecked: element == category,
            category: element,
            onChanged: onChanged
        ),
        ).toList(),
      ),
    );
  }
}