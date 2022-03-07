import 'package:cocktail/core/models.dart';
import 'package:flutter/material.dart';

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
              color: isChecked ? Color(0xff393b53) : Color(0xff15151c),
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
