// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590
import 'package:cocktail/core/models.dart';
import 'package:flutter/services.dart';
import 'package:cocktail/core/src/extensions/Color+Extensions.dart';
import 'package:flutter/material.dart';
import '../ui/widjets/filter_page/search_widjet.dart';
import '../ui/widjets/filter_page/filters_collection_widjet.dart';
import '../ui/widjets/custom_widjets/proggress_loader.dart';

import '../ui/widjets/filter_page/coctail_collection_item_widjet.dart';
import '../ui/coctail_detail_page.dart';

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

  // Routing
  void _tapCoctail(int index) async {
    print("Tap Coctail Index $index");
    final coctailID = _coctails[index].id;

    final coctailDefinitaion =
        await AsyncCocktailRepository().fetchCocktailDetails(coctailID);
    // Need

    if (coctailDefinitaion != null) {
      Navigator.of(context).push(MaterialPageRoute(
          settings: RouteSettings(name: "Cocatil Details"),
          builder: (context) {
            return CocktailDetailPage(coctailDefinitaion);
          }));
    }
  }

  Future<List<CocktailDefinition>> fetchCoctailsByFilter() async {
    final category = CocktailCategory.parse(selectedFilterName);
    final result = await AsyncCocktailRepository()
        .fetchCocktailsByCocktailCategory(category);

    _coctails = result.toList();

    return result.toList();
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
                        _coctails.length,
                        (index) => GestureDetector(
                              onTap: () => _tapCoctail(index),
                              child: CoctailCollectionItemWidjet(
                                coctail: _coctails[index],
                              ),
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
                                      child: Container(
                                    margin: EdgeInsets.only(top: 100),
                                    height: 50,
                                    width: 50,
                                    child: ProgressLoader(color: Colors.white),
                                  )),
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
