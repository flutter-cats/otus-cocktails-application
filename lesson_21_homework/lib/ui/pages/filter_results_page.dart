import 'package:flutter/material.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/ui/aplication/application_scaffold.dart';
import 'package:lesson_21_animations_homework/ui/pages/categories_fitler_bar_delegate.dart';
import 'package:lesson_21_animations_homework/ui/pages/list/cocktail_category_list.dart';

class FilterResultsPageWidget extends StatefulWidget {
  final CocktailCategory selectedCategory;

  const FilterResultsPageWidget({Key? key, required this.selectedCategory})
      : super(key: key);

  @override
  _FilterResultsPageWidgetState createState() =>
      _FilterResultsPageWidgetState(selectedCategory);
}

class _FilterResultsPageWidgetState extends State<FilterResultsPageWidget> {
  final CocktailCategory selectedCategory;
  final ValueNotifier<CocktailCategory> _categoryNotifier;

  _FilterResultsPageWidgetState(this.selectedCategory)
      : _categoryNotifier = ValueNotifier<CocktailCategory>(selectedCategory);

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      title: 'Мой бар',
      currentSelectedNavBarItem: 1,
      child: ValueListenableBuilder(
        valueListenable: _categoryNotifier,
        builder: (ctx, value, child) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 21)),
              SliverPersistentHeader(
                delegate: CategoriesFilterBarDelegate(
                  CocktailCategory.values,
                  onCategorySelected: (category) {
                    _categoryNotifier.value = category;
                  },
                  selectedCategory: _categoryNotifier.value,
                ),
                floating: true,
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24)),
              CocktailCategoryList(category: _categoryNotifier.value)
            ],
          );
        },
      ),
    );
  }
}