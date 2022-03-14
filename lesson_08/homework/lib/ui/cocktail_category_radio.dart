import 'package:cocktail/core/models.dart';
import 'package:cocktail/ui/colors.dart';
import 'package:flutter/material.dart';

class CocktailCategoryRadio extends StatelessWidget {
  final CocktailCategory value;
  final CocktailCategory? groupValue;
  final ValueChanged<CocktailCategory?> onChanged;

  const CocktailCategoryRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    return Container(
        margin: const EdgeInsets.only(top: 22, left: 0, right: 10, bottom: 22),
        child: InkWell(
            onTap: () => onChanged(value),
            splashColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 14),
              child: Text(value.value, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400)),
            )),
        decoration: BoxDecoration(
            color: isSelected ? CategorySelectedColor : CategoryDeselectedColor,
            border: Border.all(
              color: CategoryBorderColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(30))));
  }
}
