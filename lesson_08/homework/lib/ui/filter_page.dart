// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'package:cocktail/core/models.dart';
import 'package:flutter/material.dart';

class CocktailsFilterScreen extends StatefulWidget {
  @override
  State<CocktailsFilterScreen> createState() => _CocktailsFilterScreenState();
}

class _CocktailsFilterScreenState extends State<CocktailsFilterScreen> {

  CocktailCategory? _cocktailCategory = null;

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
        onPressed: () => setState(() {
          _cocktailCategory = cocktailCategory;
        }),
        child: Text(cocktailCategory.name)
    );
  }

  Future<Iterable<CocktailDefinition>> cocktailsByCategory() async {
    if (_cocktailCategory == null) {
      return [];
    }
    return AsyncCocktailRepository().fetchCocktailsByCocktailCategory(_cocktailCategory!);
  }


  Widget cocktailsFeed() {
    return FutureBuilder(
      future: cocktailsByCategory(),
      builder: (BuildContext context, AsyncSnapshot<Iterable<CocktailDefinition>> snapshot) {
        if (_cocktailCategory?.name == null) {
          return Text("Select some category");
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        else if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        else if (snapshot.hasData && snapshot.data != null) {
          return Column(
            children: snapshot.data!.map((e) => Text(e.name)).toList()
          );
        }
        else {
          return Text("eh?");
        }
      }
    );
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
