// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'package:cocktail/ui/search_widgets/category_list_view.dart';
import 'package:cocktail/ui/search_widgets/search_coctails_grid.dart';
import 'package:cocktail/ui/search_widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class CocktailsFilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1926),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchTextField(),
            CategoryListView(),
            SearchCoctailsGrid(),
          ],
        ),
      ),
    );
  }
}
