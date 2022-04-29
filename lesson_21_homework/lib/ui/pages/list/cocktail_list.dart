import 'package:flutter/material.dart';
import 'package:lesson_21_animations_homework/ui/pages/cocktail_grid_item.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

class CocktailList extends StatelessWidget {
  const CocktailList(this.cocktails, {this.category, Key? key})
      : super(key: key);

  final Iterable<CocktailDefinition?> cocktails;
  final CocktailCategory? category;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((ctx, index) {
          return CocktailGridItem(
            cocktails.elementAt(index)!,
            selectedCategory: category,
          );
        }, childCount: cocktails.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: CocktailGridItem.aspectRatio,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
