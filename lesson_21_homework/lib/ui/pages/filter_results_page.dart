import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/main.dart';
import 'package:lesson_21_animations_homework/ui/aplication/application_scaffold.dart';
import 'package:lesson_21_animations_homework/ui/pages/categories_fitler_bar_delegate.dart';
import 'package:lesson_21_animations_homework/ui/pages/cocktail_grid_item.dart';
import 'package:flutter/material.dart';

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
              _buildCocktailItems(context)
            ],
          );
        },
      ),
    );
  }

  Widget _buildCocktailItems(BuildContext context) {
    return FutureBuilder<Iterable<CocktailDefinition?>>(
        future: repository
            .fetchCocktailsByCocktailCategory(_categoryNotifier.value),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return SliverFillRemaining(
              child: Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              ),
            );
          }

          if (snapshot.hasData) {
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((ctx, index) {
                  return CocktailGridItem(
                    snapshot.data!.elementAt(index)!,
                    selectedCategory: _categoryNotifier.value,
                  );
                }, childCount: snapshot.data!.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: CocktailGridItem.aspectRatio,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  crossAxisCount: 2,
                ),
              ),
            );
          }

          return SliverFillRemaining(
            child: Center(
              child: const CircularProgressIndicator(),
            ),
          );
        });
  }
}
