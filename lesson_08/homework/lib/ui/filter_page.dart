// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590
import 'package:cocktail/core/models.dart';
import 'package:flutter/services.dart';
import 'package:cocktail/core/src/extensions/Color+Extensions.dart';
import 'package:flutter/material.dart';
import '../ui/widjets/filter_page/search_widjet.dart';
import '../ui/widjets/filter_page/filters_collection_widjet.dart';
import '../ui/widjets/filter_page/coctails_collection_widjet.dart';

// Models
//
class FilterModel {
  String name;
  bool isSelected;
  FilterModel({@required this.name, @required this.isSelected});
}

class CocktailsFilterScreen extends StatefulWidget {
  @override
  _CocktailsFilterScreenState createState() => _CocktailsFilterScreenState();
}

class _CocktailsFilterScreenState extends State<CocktailsFilterScreen> {
  List<FilterModel> filterModels = CocktailCategory.values
      .map((e) => FilterModel(name: e.value, isSelected: false))
      .toList();

  List<FilterModel> _filters;
  List<CocktailDefinition> _coctails;

  @override
  void initState() {
    _filters = filterModels;
    super.initState();
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

    // Also Should Fetch Data
    fetchCoctailsByFilter(filterName);
    setState(() {});
  }

  Future<void> fetchCoctailsByFilter(String filterName) async {
    final category = CocktailCategory.parse(filterName);
    final result = await AsyncCocktailRepository()
        .fetchCocktailsByCocktailCategory(category);
    _coctails = result;
    setState(() {});
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: HexColor("#1A1926"),
          body: SafeArea(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  children: [
                    SearchFiedlWidjet(
                      handleSubmitText: _submitCoctailname,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    FiltersCollectionWidjet(
                      filters: _filters,
                      tapFilter: _tapFilter,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    CoctailCollectionWidjet()
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

final cardSliverListDelegate = SliverChildListDelegate(List.generate(
    4,
    (index) => Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('$index')),
          ),
        )));
