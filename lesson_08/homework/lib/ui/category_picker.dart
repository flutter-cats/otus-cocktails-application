import 'package:flutter/material.dart';

import '../core/src/model/cocktail_category.dart';
import 'category_chip.dart';

class CategoryPicker extends StatelessWidget {
  const CategoryPicker({
    Key? key,
    required this.selectedCategory,
    required this.onSelected,
  }) : super(key: key);

  final void Function(CocktailCategory) onSelected;
  final CocktailCategory selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: CocktailCategory.values
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CategoryChip(
                    e,
                    onSelected: onSelected,
                    isSelected: selectedCategory == e,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
