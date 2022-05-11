import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/ui/aplication/application_scaffold.dart';
import 'package:lesson_21_animations_homework/ui/circular_progress_custom.dart';
import 'package:lesson_21_animations_homework/ui/pages/categories_fitler_bar_delegate.dart';
import 'package:lesson_21_animations_homework/ui/pages/cocktail_grid_item.dart';
import 'package:lesson_21_animations_homework/ui/pages/filter/view/filter_results_page.dart';
import 'package:flutter/material.dart';

class RandomCocktailPageWidget extends StatefulWidget {
  final AsyncCocktailRepository repository;

  const RandomCocktailPageWidget(this.repository, {Key? key}) : super(key: key);

  @override
  _RandomCocktailPageWidgetState createState() =>
      _RandomCocktailPageWidgetState();
}

class _RandomCocktailPageWidgetState extends State<RandomCocktailPageWidget> {
  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      title: 'Коктейль дня',
      currentSelectedNavBarItem: 0,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 21)),
          SliverPersistentHeader(
            delegate: CategoriesFilterBarDelegate(
              CocktailCategory.values,
              onCategorySelected: (category) {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const FilterResultsPageWidget(),
                  ),
                );
              },
            ),
            floating: true,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          _buildRandomCocktailPage(context)
        ],
      ),
    );
  }

  Widget _buildRandomCocktailPage(BuildContext context) {
    return FutureBuilder<Cocktail?>(
        future: widget.repository.getRandomCocktail(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return SliverFillRemaining(
              child: Center(
                child: Text(snapshot.error.toString()),
              ),
            );
          }

          if (snapshot.hasData) {
            final cocktail = snapshot.data!;
            final cocktailDefinition = CocktailDefinition(
              id: cocktail.id,
              name: cocktail.name,
              drinkThumbUrl: cocktail.drinkThumbUrl,
              cocktailCategory: cocktail.category.value,
            );

            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                    return CocktailGridItem(
                      cocktailDefinition,
                    );
                  },
                  childCount: 1,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: CocktailGridItem.aspectRatio,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  crossAxisCount: 1,
                ),
              ),
            );
          }
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressCustom(),
            ),
          );
        });
  }
}
