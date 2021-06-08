import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson_14_animations_homework/ui/style/custom_colors.dart';

class CocktailValueText extends StatelessWidget {
  final String characteristicValue;

  CocktailValueText({required this.characteristicValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.value_text,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        child: Text(
          characteristicValue,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
