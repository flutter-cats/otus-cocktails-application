// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'package:cocktail/core/models.dart';
import 'package:cocktail/ui/search_field.dart';
import 'package:flutter/material.dart';

import 'filter_chip_list.dart';

class CocktailsFilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = CocktailCategory.values;
    return Column(children: [
      SearchField((text) => {print(text)}),
      FilterChipGroup(
          items: categories.map((e) => e.value).toList(),
          onSelectionChanged: (values) => {print(values)})
    ]);
  }
}
