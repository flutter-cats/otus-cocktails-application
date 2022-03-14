// экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'package:cocktail/core/models.dart';
import 'package:cocktail/ui/cocktail_category_radio.dart';
import 'package:cocktail/ui/cocktail_list_item_widget.dart';
import 'package:cocktail/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CocktailsFilterScreen extends StatefulWidget {
  @override
  _CocktailsFilterScreenState createState() => _CocktailsFilterScreenState();
}

class _CocktailsFilterScreenState extends State<CocktailsFilterScreen> {
  final _searchController = TextEditingController(text: '');

  CocktailCategory? _cocktailCategory = CocktailCategory.ordinaryDrink;

  Future<List<CocktailDefinition>> getCocktails() async {
    if (_cocktailCategory != null) {
      return List.from(await AsyncCocktailRepository().fetchCocktailsByCocktailCategory(_cocktailCategory!));
    }
    return List.empty();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFF1A1926),
          body: Column(
            children: <Widget>[
              _searchTextField(),
              _categorySelector(),
              Expanded(
                  child: FutureBuilder<List<CocktailDefinition>>(
                      future: getCocktails(),
                      builder: (context, AsyncSnapshot<List<CocktailDefinition>> async) {
                        if (async.connectionState == ConnectionState.active || async.connectionState == ConnectionState.waiting) {}
                        if (async.connectionState == ConnectionState.done) {
                          if (async.hasError) {
                            return Center(
                              child: const Text("Сообщение об ошибке", style: TextStyle(color: ErrorTextColor, fontSize: 14, fontWeight: FontWeight.w400)),
                            );
                          } else if (async.hasData) {
                            List<CocktailDefinition> list = async.data ?? List.empty();
                            return CustomScrollView(slivers: <Widget>[
                              SliverGrid(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                                    return CocktailListItemWidget(context: context, value: list[index]);
                                  }, childCount: list.length))
                            ]);

                            // GridView.builder(
                            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            //   itemCount: list.length,
                            //   itemBuilder: (BuildContext context, int index) {
                            //     return CocktailListItemWidget(context: context, value: list[index]);
                            //   }));
                          }
                        }
                        return Center(
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            SvgPicture.asset('assets/images/shaker.svg', color: Colors.white),
                            const Text("Поиск...", style: TextStyle(color: ErrorTextColor, fontSize: 14, fontWeight: FontWeight.w400))
                          ]),
                        );
                      }))
            ],
          )),
    );
  }

  Widget _searchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: TextField(
          decoration: InputDecoration(
            prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10),
                child: SvgPicture.asset(
                  'assets/images/icon_search.svg',
                  color: Colors.white,
                )),
            suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  icon: SvgPicture.asset('assets/images/icon_clear.svg', color: Colors.white),
                  onPressed: () => _searchController.clear(),
                )),
            contentPadding: const EdgeInsets.only(left: 10, right: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: SearchBorderColor, width: 2),
              borderRadius: BorderRadius.circular(65),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: SearchBorderColor, width: 2),
              borderRadius: BorderRadius.circular(65),
            ),
          ),
          controller: _searchController,
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
    );
  }

  Widget _categorySelector() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(children: [
              for (var item in CocktailCategory.values)
                CocktailCategoryRadio(
                    value: item,
                    groupValue: _cocktailCategory,
                    onChanged: (value) {
                      setState(() => _cocktailCategory = value);
                    })
            ])));
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
}
