// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590
import 'package:cocktail/ui/cocktails_list.dart';
import 'package:flutter/material.dart';

import '../core/src/model/cocktail_category.dart';
import '../core/src/model/cocktail_definition.dart';
import '../core/src/repository/async_cocktail_repository.dart';

import 'category_picker.dart';

class CocktailsFilterScreen extends StatefulWidget {
  @override
  State<CocktailsFilterScreen> createState() => _CocktailsFilterScreenState();
}

class _CocktailsFilterScreenState extends State<CocktailsFilterScreen> {
  CocktailCategory selectedCategory = CocktailCategory.values.first;
  AsyncCocktailRepository repository = AsyncCocktailRepository();
  Future<List<CocktailDefinition>> _cocktailsList = Future.value([]);

  @override
  void initState() {
    super.initState();

    _cocktailsList = getCocktails();
  }

  Future<List<CocktailDefinition>> getCocktails() async {
    var cocktails =
        await repository.fetchCocktailsByCocktailCategory(selectedCategory);
    return cocktails.toList();
  }

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
            onPressed: () => {},
            icon: Icon(Icons.close),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(65.0),
          ),
          hintText: "Название коктейля",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(
                0.8, 0.0), // 10% of the width, so there are ten blinds.
            colors: <Color>[
              Color(0xff1A1927),
              Color(0xff0B0B12)
            ], // red to yellow
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              buildSearchBar(),
              CategoryPicker(
                selectedCategory: selectedCategory,
                onSelected: (c) => {
                  setState(() {
                    selectedCategory = c;
                    _cocktailsList = getCocktails();
                  })
                },
              ),
              CocktailsList(_cocktailsList),
            ],
          ),
        ),
      ),
    );
  }
}
