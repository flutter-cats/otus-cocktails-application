import 'package:flutter/material.dart';

import '../core/src/model/cocktail_category.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip(
      this.category, {
        Key? key,
        required this.isSelected,
        required this.onSelected,
      }) : super(key: key);

  final void Function(CocktailCategory) onSelected;
  final CocktailCategory category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {onSelected(category)},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isSelected ? Color(0xff3B3953) : Color(0xff201F2C),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: Color(0xff2D2C39)),
          ),
        ),
      ),
      child: Text(category.value),
    );
  }
}
