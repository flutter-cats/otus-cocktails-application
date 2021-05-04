// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590
import 'package:cocktail/core/models.dart';
import 'package:flutter/services.dart';
import 'package:cocktail/core/src/extensions/Color+Extensions.dart';
import 'package:flutter/material.dart';
import '../ui/widjets/filter_page/search_widjet.dart';
import '../ui/widjets/filter_page/filters_collection_widjet.dart';
import 'dart:io';

import '../ui/widjets/filter_page/coctail_collection_item_widjet.dart';

// Models
//
class FilterModel {
  String name;
  bool isSelected;
  FilterModel({required this.name, required this.isSelected});
}

class CocktailsFilterScreen extends StatefulWidget {
  @override
  _CocktailsFilterScreenState createState() => _CocktailsFilterScreenState();
}

class _CocktailsFilterScreenState extends State<CocktailsFilterScreen> {
  List<FilterModel> filterModels = CocktailCategory.values
      .map((e) => FilterModel(name: e.value, isSelected: false))
      .toList();

  late List<FilterModel> _filters;
  List<CocktailDefinition> _coctails = [];

  late String errorMessage;

  late String selectedFilterName;

  @override
  void initState() {
    _filters = filterModels;
    super.initState();
  }

  // @override
  void didChangeDependencies() {
    _filters[0].isSelected = true;
    selectedFilterName = _filters[0].name;

    super.didChangeDependencies();
  }

  // Funcs
  void _submitCoctailname(String text) {
    print("Submit $text");
  }

  void _tapFilter(String filterName) {
    print("name $filterName");

    _filters.forEach((element) {
      element.isSelected = false;
    });

    final index = _filters.indexWhere((element) => element.name == filterName);
    _filters[index].isSelected = true;

    selectedFilterName = filterName;

    setState(() {});
  }

  Future<List<CocktailDefinition>> fetchCoctailsByFilter() async {
    final category = CocktailCategory.parse(selectedFilterName);
    final result = await AsyncCocktailRepository()
        .fetchCocktailsByCocktailCategory(category);

    _coctails = result.toList();

    return result.toList();
  }

  @override
  Widget build(BuildContext context) {
    // Sliver Card delegate

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: HexColor("#1A1926"),
          body: SafeArea(
            child: FutureBuilder(
                future: fetchCoctailsByFilter(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  // Card Delegate
                  final coctailCardDelegate = SliverChildListDelegate(
                    List.generate(
                        _coctails == null ? 0 : _coctails.length,
                        (index) => CoctailCollectionItemWidjet(
                              coctail: _coctails[index],
                            )),
                  );

                  if (snapshot.hasError || snapshot.hasData == null) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  print("Fetcy ${snapshot.connectionState}");
                  // print("SnapSHot ${snapshot.data}");
                  return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: SearchFiedlWidjet(
                              handleSubmitText: _submitCoctailname,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: const SizedBox(
                              height: 22,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: FiltersCollectionWidjet(
                              filters: _filters,
                              tapFilter: _tapFilter,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: const SizedBox(
                              height: 22,
                            ),
                          ),
                          snapshot.connectionState == ConnectionState.waiting
                              ? SliverToBoxAdapter(
                                  child: Center(
                                      // Here we need to set custom Activity Indicator!
                                      child: CircularProgressIndicator()),
                                )
                              : SliverPadding(
                                  padding: EdgeInsets.fromLTRB(26, 0, 26, 0),
                                  sliver: SliverGrid(
                                    delegate: coctailCardDelegate,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.85,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 20,
                                    ),
                                  ),
                                )
                        ],
                      ));
                  // snapshot has data
                }),
          ),
        ));
  }
}
