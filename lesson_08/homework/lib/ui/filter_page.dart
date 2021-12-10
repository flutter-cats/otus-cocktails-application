// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'package:cocktail/core/models.dart';
import 'package:cocktail/core/src/globals.dart';
import 'package:cocktail/ui/search_widgets/category_list_view.dart';
import 'package:cocktail/ui/search_widgets/res/consts.dart';
import 'package:cocktail/ui/search_widgets/search_coctails_grid.dart';
import 'package:cocktail/ui/search_widgets/search_error.dart';
import 'package:cocktail/ui/search_widgets/search_loading.dart';
import 'package:cocktail/ui/search_widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CocktailsFilterScreen extends StatefulWidget {
  @override
  State<CocktailsFilterScreen> createState() => _CocktailsFilterScreenState();
}

class _CocktailsFilterScreenState extends State<CocktailsFilterScreen> {
  CocktailCategory chosenCategory = CocktailCategory.values.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchTextField(),
            Container(
              height: 46,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  for (CocktailCategory category in CocktailCategory.values)
                    getCategoryItem(category, category == chosenCategory, () {
                      super.setState(() => chosenCategory = category);
                    }),
                ],
              ),
            ),
            // SearchCoctailsGrid(GetCoctails()
            //     .getListOfCoctailFromChoisedCategories(
            //         Globals.chosenCategories)),
            // SearchLoadingScreen(),
            // SearchError("передал ошибку"),
          ],
        ),
      ),
    );
  }
}
