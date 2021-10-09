// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'package:cocktail/core/models.dart';
import 'package:cocktail/ui/search_field.dart';
import 'package:flutter/material.dart';

import 'filter_chip_list.dart';

class CocktailsFilterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CocktailsFilterScreenState();
  }
}

class _CocktailsFilterScreenState extends State<CocktailsFilterScreen> {
  final repository = AsyncCocktailRepository();

  final categories = CocktailCategory.values;
  var selectedCategories = <String>[];
  var searchText = "";
  var isFirstInit = true;

  Future<Iterable<CocktailDefinition>>? categoryFuture;

  @override
  void setState(VoidCallback fn) {
    if (!isFirstInit) {
      super.setState(fn);
    }
    if (selectedCategories.isNotEmpty) {
      categoryFuture =
          repository.fetchCocktailsByCategories(selectedCategories);
    } else {
      categoryFuture = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SearchField((text) => {print(text), searchText = text}),
      FilterChipGroup(
          items: categories.map((e) => e.value).toList(),
          onSelectionChanged: (values) => {
                print(values),
                if (!isFirstInit)
                  {toggleState(values)}
                else
                  {isFirstInit = false}
              }),
      selectedCategories.isNotEmpty
          ? _buildListResult(categoryFuture!)
          : Center(
              heightFactor: 24,
              child: Text('Нет результатов',
                  style: TextStyle(color: Colors.white)))
    ]);
  }

  void toggleState(List<String> elements) {
    selectedCategories.clear();
    if (elements.isNotEmpty) {
      selectedCategories.addAll(elements);
    }
    setState(() {});
  }

  FutureBuilder<Iterable<CocktailDefinition>> _buildListResult(
      Future<Iterable<CocktailDefinition>> future) {
    return FutureBuilder<Iterable<CocktailDefinition>>(
        future: future,
        builder: (context, snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Text('here is data: ${snapshot.requireData.first.name}',
                  style: TextStyle(color: Colors.white))
            ];
          } else if (snapshot.hasError) {
            children = [
              Text('Сообщение об ошибке', style: TextStyle(color: Colors.white))
            ];
          } else {
            children = [
              Align(
                  alignment: Alignment.center,
                  child:
                      Text('Поиск...', style: TextStyle(color: Colors.white)))
            ];
          }

          return Center(
              heightFactor: 20,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: children));
        });
  }
}
