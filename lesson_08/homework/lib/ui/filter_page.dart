// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'package:cocktail/core/models.dart';
import 'package:flutter/material.dart';

class CocktailsFilterScreen extends StatelessWidget {

  final repository = AsyncCocktailRepository();

  Widget searchBar() {
    return TextField(
        decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter a search term',
      )
    );
  }

  Widget cocktailCategories() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
        children: CocktailCategory.values.map((e) => cocktailCategoryButton(e)).toList()
      )
    );
  }

  Widget cocktailCategoryButton(CocktailCategory cocktailCategory) {
    return TextButton(
        onPressed: () => loadCocktailsByCategory(cocktailCategory),
        child: Text(cocktailCategory.name)
    );
  }

  void loadCocktailsByCategory(CocktailCategory cocktailCategory) async {
    var categories = repository.fetchCocktailsByCocktailCategory(cocktailCategory);
    debugPrint("sup");
  }

  Widget cocktailsFeed() {
    CocktailCategory category;

    final Future<Iterable<CocktailDefinition>> future = repository.fetchCocktailsByCocktailCategory(CocktailCategory.beer);

    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<Iterable<CocktailDefinition>> snapshot) {
        return Text("eh");
      }
    );

    // final cards = cocktails.map((e) => cocktailCard(e)).toList();
    // return Column(
    //   children: cards
    // );
  }

  Widget cocktailCard(Cocktail cocktail) {
    return Text(cocktail.name);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            color: const Color(0xFF1A1926),
            height: 50,
          ),
          searchBar(),
          cocktailCategories(),
          cocktailsFeed()
        ],
      )
    );
  }
}
