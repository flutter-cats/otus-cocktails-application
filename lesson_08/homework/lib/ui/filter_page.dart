// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cocktail/core/models.dart';
import 'package:cocktail/style/style.dart';
import 'package:cocktail/ui/widgets/filters/single_filter.dart';
import 'package:cocktail/ui/widgets/inputs/search_field.dart';
import 'package:cocktail/ui/widgets/cards/cocktail_definition_card.dart';

class CocktailsFilterScreen extends StatefulWidget {
  @override
  _CocktailsFilterScreenState createState() => _CocktailsFilterScreenState();
}

class _CocktailsFilterScreenState extends State<CocktailsFilterScreen> {
  final String _loadingIcon = 'assets/images/icons/icon_shake.svg';
  final String _noDataMessage = 'No data';
  final String _searchMessage = 'Поиск ...';
  Map<String, String> _cocktailCategoryFilter = {};
  // State variables
  Map<String, List<CocktailDefinition>> _coctails;
  Map<String, ConnectionState> _cocktailsStatus;
  String _activeCategory;
  String _cocktailName;

  @override
  void initState() {
    _activeCategory = CocktailCategory.ordinaryDrink.value;
    _coctails = {};
    _cocktailsStatus = {};
    _cocktailName = '';
    super.initState();
  }

  void _setActiveCategory(String categoryValue) {
    setState(() => _activeCategory = categoryValue);
  }

  void _setCocktailName(String cocktailName) {
    setState(() => _cocktailName = cocktailName);
  }

  void _clearCocktailName() {
    setState(() => _cocktailName = '');
  }

  Map<String, String> get cocktailCategoryFilter {
    if (_cocktailCategoryFilter.length == 0) {
      CocktailCategory.values.forEach(
          (element) => _cocktailCategoryFilter[element.name] = element.value);
    }

    return _cocktailCategoryFilter;
  }

  Future<List<CocktailDefinition>> fetchCocktailsByCocktailCategory() async {
    final category = CocktailCategory.parse(_activeCategory);
    final result = await AsyncCocktailRepository()
        .fetchCocktailsByCocktailCategory(category);

    _coctails[_activeCategory] = result;

    return result;
  }

  Stream<List<CocktailDefinition>> _getCocktailsByCocktailCategory() async* {
    if (_cocktailsStatus[_activeCategory] == ConnectionState.done) {
      yield _coctails[_activeCategory];
    }

    final cocktails = await fetchCocktailsByCocktailCategory();
    _coctails[_activeCategory] = cocktails;
    _cocktailsStatus[_activeCategory] = ConnectionState.done;
    yield cocktails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: _buildHeader,
        body: Container(
          color: AppColors.background,
          padding: EdgeInsets.only(top: 22),
          child: CustomScrollView(
            slivers: [
              // Build filters (category)
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    child: SingleFilter(
                      activeFilter: _activeCategory,
                      filters: cocktailCategoryFilter,
                      setActiveFilter: _setActiveCategory,
                    ),
                  )
                ]),
                // child: ,
              ),
              // Build content (list of categories or no data text)
              _buildContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetByCenter(BuildContext context, Widget widget) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: widget,
    );
  }

  Widget _buildMessage(BuildContext context, message) {
    return _buildWidgetByCenter(
      context,
      Center(
        child: Text(
          message,
          style: TextStyle(color: AppColors.primaryText),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return _buildWidgetByCenter(
      context,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            _loadingIcon,
            width: 36,
            height: 36,
          ),
          Text(
            _searchMessage,
            style: TextStyle(color: AppColors.primaryText),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildHeader(BuildContext context, bool innerBoxIsScrolled) {
    return [
      SliverAppBar(
        backgroundColor: AppColors.background,
        toolbarHeight: 90,
        title: Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: SearchField(
            changeText: _setCocktailName,
            clearText: _clearCocktailName,
          ),
        ),
      ),
    ];
  }

  Widget _buildContent(BuildContext context) {
    return StreamBuilder(
      stream: _getCocktailsByCocktailCategory(),
      builder: (BuildContext context,
          AsyncSnapshot<List<CocktailDefinition>> snapshot) {
        // Has error
        if (snapshot.hasError) {
          return SliverToBoxAdapter(
              child: _buildMessage(context, snapshot.error.toString()));
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return SliverToBoxAdapter(child: _buildLoading(context));

            case ConnectionState.done:
            case ConnectionState.active:
              if (snapshot.hasData == null &&
                  _coctails[_activeCategory] == null) {
                return SliverToBoxAdapter(
                    child: _buildMessage(context, _noDataMessage));
              }

              List<CocktailDefinition> coctails = _coctails[_activeCategory]
                  .where((element) =>
                      element.name.toLowerCase().contains(_cocktailName))
                  .toList();

              if (coctails.length == 0) {
                return SliverToBoxAdapter(
                    child: _buildMessage(context, _noDataMessage));
              }

              List<CocktailDefinitionCard> cards = coctails
                  .map(
                    (element) => CocktailDefinitionCard(
                      cocktailDefinition: element,
                    ),
                  )
                  .toList();

              return SliverPadding(
                padding: EdgeInsets.fromLTRB(26, 22, 26, 0),
                sliver: SliverGrid(
                  delegate: SliverChildListDelegate(cards),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                  ),
                ),
              );

            default:
              return SliverToBoxAdapter(
                  child: _buildMessage(context, _noDataMessage));
          }
        }
      },
    );
  }
}
