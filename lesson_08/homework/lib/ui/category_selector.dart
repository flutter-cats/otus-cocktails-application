import 'package:cocktail/core/models.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: CocktailCategory.values.map((value) => Card(
          child: Text(value.value),
        )).toList(),
      ),
    );
  }
}