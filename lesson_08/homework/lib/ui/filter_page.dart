// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590
import 'package:flutter/services.dart';
import 'package:cocktail/core/src/extensions/Color+Extensions.dart';
import 'package:flutter/material.dart';
import '../ui/widjets/filter_page/search_widjet.dart';
import '../ui/widjets/filter_page/filters_collection_widjet.dart';

class CocktailsFilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: HexColor("#1A1926"),
          body: SafeArea(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  children: [
                    SearchFiedlWidjet(),
                    FiltersCollectionWidjet(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
