import 'package:flutter/material.dart';
import 'package:homework/ui/constants.dart';

import '../../core/src/model/cocktail_category.dart';

class CategoryCheckTag extends StatelessWidget {
  late final CocktailCategory category;
  late final bool isChecked;
  late final void Function(CocktailCategory) onChanged;

  CategoryCheckTag({
    required this.category,
    required this.isChecked,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(category);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
              color: isChecked ? Constants.checkedTagColor : Constants.uncheckedTagColor,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(category.value),
          ),
        ),
      ),
    );
  }
}
