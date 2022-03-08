// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'package:cocktail/core/models.dart';
import 'package:cocktail/ui/category_selector.dart';
import 'package:cocktail/ui/components/search_result_card.dart';
import 'package:flutter/material.dart';

class CocktailsFilterScreen extends StatefulWidget {
  @override
  State<CocktailsFilterScreen> createState() => _CocktailsFilterScreenState();
}

class _CocktailsFilterScreenState extends State<CocktailsFilterScreen> {
  CocktailCategory _checkedCategory = CocktailCategory.ordinaryDrink;

  void _changeCategory(CocktailCategory category) {
    _checkedCategory = category;
    setState(() {});
  }

  Widget spacer = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff191826),
        body: Column(
          children: [
            Container(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  filled: true,
                  hintText: "Введите название коктейля",
                ),
              ),
            ),
            spacer,
            CategorySelector(
              category: _checkedCategory,
              onChanged: _changeCategory,
            ),
            spacer,
            Expanded(
              child: FutureBuilder<Iterable<CocktailDefinition>>(
                  future: AsyncCocktailRepository()
                      .fetchCocktailsByCocktailCategory(_checkedCategory),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Ошибка загрузки: ${snapshot.error}'));
                        } else {
                          return CustomScrollView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            slivers: [
                              SliverGrid(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.0,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5),
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) => SearchResultCard(
                                      definition: snapshot.data!.elementAt(index),
                                    ),
                                  childCount: snapshot.data!.length
                                ),
                              ),
                            ],
                          );
                        }
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
