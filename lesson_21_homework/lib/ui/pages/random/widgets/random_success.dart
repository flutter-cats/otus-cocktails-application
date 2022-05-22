import 'package:flutter/material.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

import '../../cocktail_grid_item.dart';

class RandomSuccess extends StatelessWidget {
  const RandomSuccess({Key? key, required this.cocktail}) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
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
}
