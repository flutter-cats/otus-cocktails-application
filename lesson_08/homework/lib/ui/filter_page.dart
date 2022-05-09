// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'package:cocktail/core/models.dart';
import 'package:cocktail/ui/widgets/choicechip_list.dart';
import 'package:cocktail/ui/widgets/search_item.dart';
import 'package:cocktail/ui/widgets/search_row.dart';
import 'package:flutter/material.dart';

class CocktailsFilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF1A1927), Color(0xFF0B0B12)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SearchRow(),
                ChoiceChipList(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 26),
                    child: StreamBuilder<Iterable<CocktailDefinition>>(
                        stream: asyncCR.controller.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: SizedBox(
                                width: 250,
                                child: Text(
                                  "Произошла ошибка - ${snapshot.error}",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            );
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: Column(
                                children: [
                                  CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Поиск...",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          }
                          return CustomScrollView(
                            slivers: [
                              SliverGrid(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 5,
                                        mainAxisExtent: 163),
                                delegate: SliverChildBuilderDelegate(
                                    ((context, index) {
                                  return SearchItem(
                                      item: snapshot.data?.toList()[index]);
                                }), childCount: 8),
                              )
                            ],
                          );
                        }),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
