import 'package:flutter/material.dart';
import 'package:lesson_21_animations_homework/main.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/ui/pages/list/cocktail_list.dart';

class CocktailCategoryList extends StatelessWidget {
  const CocktailCategoryList({required this.category, Key? key})
      : super(key: key);

  final CocktailCategory category;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<CocktailDefinition?>>(
        future: repository.fetchCocktailsByCocktailCategory(category),
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
            return CocktailList(
              snapshot.data!,
              category: category,
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
