import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/main.dart';
import 'package:lesson_21_animations_homework/ui/aplication/application_scaffold.dart';
import 'package:lesson_21_animations_homework/ui/pages/categories_fitler_bar_delegate.dart';
import 'package:lesson_21_animations_homework/ui/pages/cocktail_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:lesson_21_animations_homework/ui/pages/filter/cubit/selected_category_cubit.dart';

class FilterResultsPageWidget extends StatelessWidget {
  const FilterResultsPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      title: 'Мой бар',
      currentSelectedNavBarItem: 1,
      child: BlocBuilder<SelectedCategoryCubit, SelectedCategoryState>(
        builder: (context, state) {
          final cubit = context.read<SelectedCategoryCubit>();
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(height: 21),
              ),
              SliverPersistentHeader(
                delegate: CategoriesFilterBarDelegate(
                  CocktailCategory.values,
                  onCategorySelected: (category) {
                    cubit.updateCategory(category);
                  },
                  selectedCategory: state.cocktailCategory,
                ),
                floating: true,
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 24),
              ),
              CocktailItems(cocktailCategory: state.cocktailCategory),
            ],
          );
        },
      ),
    );
  }
}

class CocktailItems extends StatelessWidget {
  const CocktailItems({Key? key, required this.cocktailCategory})
      : super(key: key);

  final CocktailCategory cocktailCategory;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<CocktailDefinition?>>(
        future: repository.fetchCocktailsByCocktailCategory(cocktailCategory),
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
            final Iterable<CocktailDefinition?>? cocktails = snapshot.data;
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((ctx, index) {
                  return CocktailGridItem(
                    cocktails!.elementAt(index)!,
                  );
                }, childCount: cocktails!.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: CocktailGridItem.aspectRatio,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  crossAxisCount: 2,
                ),
              ),
            );
          }

          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
