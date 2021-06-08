// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'package:cocktail/core/src/model/cocktail_definition.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

import '../core/src/model/cocktail_category.dart';
import '../core/src/repository/async_cocktail_repository.dart';

class CocktailsFilterScreen extends StatefulWidget {
  @override
  _CocktailsFilterScreen createState() => _CocktailsFilterScreen();
}

class _CocktailsFilterScreen extends State<CocktailsFilterScreen> {
  CocktailCategory selectedCategory = CocktailCategory.values.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1A1926),
      child: Column(
        children: [
          Container(
            height: 44,
            color: Colors.black,
          ),
          Padding(
              padding: EdgeInsets.only(left: 13.0, right: 13, bottom: 22),
              child: OutlineSearchBar(
                  backgroundColor: Color(0xFF181723),
                  borderColor: Color(0xFF464551),
                  borderRadius: BorderRadius.all(Radius.circular(65.0)),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ))),
          Container(
            height: 46,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: [
                for (var category in CocktailCategory.values)
                  _filterItem(category.value, category == selectedCategory, () {
                    setState(() => selectedCategory = category);
                    AsyncCocktailRepository()
                        .fetchCocktailsByCocktailCategory(selectedCategory);
                  }),
              ],
            ),
          ),
          FutureBuilder(
            //initialData: AsyncCocktailRepository().fetchCocktailsByCocktailCategory(selectedCategory),
            future: AsyncCocktailRepository()
                .fetchCocktailsByCocktailCategory(selectedCategory),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(
                    child: Center(
                        child: Container(
                            height: 70,
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/shaker1.png'),
                                ),
                                _normalText('Поиск...'),
                              ],
                            ))));
              }

              if (snapshot.connectionState == ConnectionState.active) {}

              if (snapshot.connectionState == ConnectionState.done) {}

              if (snapshot.hasError) {
                return Expanded(
                    //alignment: Alignment.center,
                    child:
                        Center(child: _normalText(snapshot.error.toString())));
              }

              if (snapshot.hasData) {
                Iterable<CocktailDefinition> result = snapshot.data;
                return Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(18),
                        child: CustomScrollView(slivers: [
                          SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Stack(children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: Image.network(result
                                              .elementAt(index)
                                              .drinkThumbUrl)),
                                      Positioned(
                                          bottom: 50,
                                          left: 16,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              38,
                                          height: 34,
                                          child: _cocktailName(
                                              result.elementAt(index).name)),
                                      Positioned(
                                          bottom: 16,
                                          left: 14,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF15151C),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30))),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 6,
                                                    right: 15,
                                                    bottom: 6,
                                                    left: 15),
                                                child: _normalText(
                                                    'id:${result.elementAt(index).id}',
                                                    fontSize: 10),
                                              )))
                                    ]));
                              },
                              childCount: result.length,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        (MediaQuery.of(context).size.width /
                                                180)
                                            .toInt()),
                          ),
                        ])));
              }

              return null;
            },
          )
        ],
      ),
    );
  }
}

Widget _filterItem(String text, bool selected, select) {
  return GestureDetector(
      onTap: () => select(),
      child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Container(
              decoration: BoxDecoration(
                color: selected ? Color(0xFF3B3953) : Color(0xFF201F2C),
                border: Border.all(color: Color(0xFF2D2C39)),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              //color: Colors.black,
              child: Padding(
                  padding: EdgeInsets.only(top: 14, right: 16, left: 16),
                  child: _normalText(text)))));
}

Widget _normalText(String text, {double fontSize = 15}) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.normal,
      fontSize: fontSize,
    ),
  );
}

Widget _cocktailName(String text) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
    style: TextStyle(
      color: Colors.white,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.normal,
      fontSize: 14,
      shadows: [
        Shadow(
          blurRadius: 3,
          color: Colors.black,
          offset: Offset(0, 0),
        ),
      ],
    ),
  );
}
