import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/ui/aplication/application_scaffold.dart';
import 'package:lesson_21_animations_homework/ui/pages/categories_fitler_bar_delegate.dart';
import 'package:lesson_21_animations_homework/ui/pages/cocktail_grid_item.dart';
import 'package:lesson_21_animations_homework/ui/pages/filter/view/filter_results_page.dart';
import 'package:flutter/material.dart';
import 'package:lesson_21_animations_homework/ui/pages/random/cubit/random_cubit.dart';
import 'package:lesson_21_animations_homework/ui/pages/random/cubit/random_cubit.dart';

import '../../circular_progress_custom.dart';

class RandomCocktailPage extends StatelessWidget {
  const RandomCocktailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      title: 'Коктейль дня',
      currentSelectedNavBarItem: 0,
      child: BlocProvider(
        create: (context) => RandomCubit(
            RepositoryProvider.of<RemoteCocktailRepositoryImpl>(context))
          ..fetchRandomCocktail(),
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
            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
            RandomCocktailCard()
          ],
        ),
      ),
    );
  }
}

class RandomCocktailCard extends StatelessWidget {
  const RandomCocktailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomCubit, RandomState>(
      builder: (context, state) {
        switch (state.status) {
          case RandomStatus.initial:
          case RandomStatus.loading:
            return const SliverFillRemaining(
              child: Center(
                child: CircularProgressCustom(),
              ),
            );

          case RandomStatus.success:
            final cocktail = state.cocktail!;
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

          case RandomStatus.failure:
            return SliverFillRemaining(
              child: Center(
                child: Text(
                  state.exception.toString(),
                ),
              ),
            );
          case RandomStatus.success:
            return const SliverFillRemaining(
              child: Center(
                child: CircularProgressCustom(),
              ),
            );
        }
      },
    );
  }
}

// class RandomCocktailCard extends StatelessWidget {
//   const RandomCocktailCard({Key? key, required this.repository})
//       : super(key: key);
//
//   final RemoteCocktailRepositoryImpl repository;
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Cocktail?>(
//         future: repository.getRandomCocktail(),
//         builder: (ctx, snapshot) {
//           if (snapshot.hasError) {
//             return SliverFillRemaining(
//               child: Center(
//                 child: Text(snapshot.error.toString()),
//               ),
//             );
//           }
//
//           if (snapshot.hasData) {
//             final cocktail = snapshot.data!;
//             final cocktailDefinition = CocktailDefinition(
//               id: cocktail.id,
//               name: cocktail.name,
//               drinkThumbUrl: cocktail.drinkThumbUrl,
//               cocktailCategory: cocktail.category.value,
//             );
//
//             return SliverPadding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               sliver: SliverGrid(
//                 delegate: SliverChildBuilderDelegate(
//                   (ctx, index) {
//                     return CocktailGridItem(
//                       cocktailDefinition,
//                     );
//                   },
//                   childCount: 1,
//                 ),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   childAspectRatio: CocktailGridItem.aspectRatio,
//                   crossAxisSpacing: 6,
//                   mainAxisSpacing: 6,
//                   crossAxisCount: 1,
//                 ),
//               ),
//             );
//           }
//           return const SliverFillRemaining(
//             child: Center(
//               child: CircularProgressCustom(),
//             ),
//           );
//         });
//   }
// }
