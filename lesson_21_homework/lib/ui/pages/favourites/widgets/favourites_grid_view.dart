import 'package:flutter/material.dart';

import '../../../../core/models.dart';
import '../../cocktail_grid_item.dart';

class FavouritesGridView extends StatelessWidget {
  const FavouritesGridView(
    this.favourites, {
    Key? key,
  }) : super(key: key);

  final Iterable<CocktailDefinition> favourites;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (ctx, index) {
              return CocktailGridItem(
                favourites.elementAt(index),
              );
            },
            childCount: favourites.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: CocktailGridItem.aspectRatio,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            crossAxisCount: 2,
          ),
        ),
      ),
    ]);
  }
}
