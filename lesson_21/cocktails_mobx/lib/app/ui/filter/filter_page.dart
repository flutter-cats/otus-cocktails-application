import 'package:cocktails_mobx/app/core/models.dart';
import 'package:cocktails_mobx/app/state/categories/categories_store.dart';
import 'package:cocktails_mobx/app/state/cocktails/cocktails_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../cocktails/cocktail_grid_item.dart';
import '../cocktails/cocktails_grid_delegate.dart';
import 'filter_bar.dart';

class CocktailsFilterScreenCustomBlocStyle extends StatelessWidget {
  const CocktailsFilterScreenCustomBlocStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 21)),
            _buildFilterBar(context),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            _buildCocktailItems(context)
          ],
        ),
      ),
    );
  }

  Widget _buildFilterBar(BuildContext context) {
    return Observer(
      builder: (context) {
        final categoriesStore = Provider.of<CategoriesStore>(context);

        return SliverPersistentHeader(
          delegate: CategoriesFilterBarDelegate(
            categoriesStore.categories,
            onCategorySelected: (category) {
              categoriesStore.selectCategory(category);
            },
            selectedCategory: categoriesStore.selectedCategory,
          ),
          floating: true,
        );
      },
    );
  }

  Widget _buildCocktailItems(BuildContext context) {
    return Observer(
      builder: (context) {
        final cocktailsStore = Provider.of<CocktailsStore>(context);
        return _buildItems(cocktailsStore.cocktails);
      },
    );
  }

  Widget _buildItems(Iterable<CocktailDefinition> cocktails) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate((ctx, index) {
            return CocktailGridItem(cocktails.elementAt(index));
          }, childCount: cocktails.length),
          gridDelegate: cocktailsGridDelegate),
    );
  }
}
