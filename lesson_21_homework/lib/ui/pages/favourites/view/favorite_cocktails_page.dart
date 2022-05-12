import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/ui/aplication/application_scaffold.dart';
import 'package:flutter/material.dart';

import '../../cocktail_grid_item.dart';
import '../cubit/favourites_cubit.dart';

class FavouriteCocktailsPage extends StatelessWidget {
  const FavouriteCocktailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      title: 'Избранное',
      currentSelectedNavBarItem: 2,
      child: BlocBuilder<FavouritesCubit, FavouritesState>(
        builder: (context, state) {
          final favourites = state.favouriteCocktailsMap.values;
          if (favourites.isNotEmpty) {
            return Favourites(
              favourites,
            );
          }
          return const Center(child: Text('В избранном ничего нет'));
        },
      ),
    );
  }
}

class Favourites extends StatelessWidget {
  const Favourites(
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
