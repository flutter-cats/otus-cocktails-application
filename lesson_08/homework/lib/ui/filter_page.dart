// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'package:cocktail/core/models.dart';
import 'package:cocktail/ui/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'coctail_detail_page.dart';
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
    if (isFirstInit) {
      // initPreselection();
    }
    return Column(children: [
      SearchField((text) => {print(text), searchText = text}),
      FilterChipGroup(
          items: categories.map((e) => e.value).toList(),
          preselectedItems: isFirstInit ? selectedCategories : null,
          onSelectionChanged: (values) => {
                if (!isFirstInit)
                  {toggleState(values)}
                else
                  {isFirstInit = false}
              }),
      selectedCategories.isNotEmpty
          ? _buildListResult(categoryFuture!)
          : Center(
              heightFactor: 22,
              child: Text('Нет результатов',
                  style: TextStyle(color: Colors.white)))
    ]);
  }

  void initPreselection() {
    selectedCategories.add(categories.first.value);
    categoryFuture = repository.fetchCocktailsByCategories(selectedCategories);
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
          Widget child;
          if (snapshot.hasData) {
            child = LayoutBuilder(builder: (context, constraints) {
              return Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 250,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                      child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.8,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16),
                          shrinkWrap: true,
                          children: _buildListItems(snapshot.requireData))));
            });
          } else if (snapshot.hasError) {
            child = Center(
                heightFactor: 22,
                child: Text('Сообщение об ошибке',
                    style: TextStyle(color: Colors.white)));
          } else {
            child = Padding(
                padding: EdgeInsets.only(top: 200),
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    SvgPicture.asset('assets/images/shaker.svg'),
                    Text('Поиск...', style: TextStyle(color: Colors.white)),
                  ],
                ));
          }

          return Container(child: child);
        });
  }

  List<Widget> _buildListItems(Iterable<CocktailDefinition> response) {
    var list = <Widget>[];
    response.forEach((e) => list.add(GestureDetector(
        onTap: () => {getCocktailAndOpenDetails(e.id)},
        child: Container(
          width: 160,
          height: 200,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                  child: Image.network(
                    e.drinkThumbUrl,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              _buildWidgetItemTitle(e),
              Positioned(
                  left: 14,
                  bottom: 6,
                  child: Chip(
                    label: Text(
                      'id: ${e.id}',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    backgroundColor: Color(0xFF15151C),
                  )),
            ],
          ),
        ))));
    return list;
  }

  Positioned _buildWidgetItemTitle(CocktailDefinition e) {
    return Positioned(
        bottom: 50,
        left: 10,
        child: Container(
            width: 140,
            child: Padding(
                padding: EdgeInsets.only(left: 5, right: 20),
                child: Text(
                  e.name,
                  maxLines: 2,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ))));
  }

  ///парсер поломан, постоянно падает с нпе, чтоб починить надо его целиком переписывать :\
  void getCocktailAndOpenDetails(String id) async {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => FutureBuilder<Cocktail?>(
          future: repository.fetchCocktailDetails(id),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return Material(
                child: CocktailDetailPage(snapshot.data!),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
