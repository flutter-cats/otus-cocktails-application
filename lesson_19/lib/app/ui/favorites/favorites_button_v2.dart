import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_17/app/bloc_sample/favorites/favorites_cubit.dart';
import 'package:lesson_17/app/core/models.dart';

// пример работы с watch и select
// Показать что виджет не перестраивается
class FavoritesButtonV2 extends StatelessWidget {
  const FavoritesButtonV2(
    this.cocktailDefinition, {
    Key? key,
  }) : super(key: key);

  final CocktailDefinition cocktailDefinition;

  @override
  Widget build(BuildContext context) {
    final isFavorites = context
        .watch<FavoritesCubit>()
        .state
        .isFavorites(cocktailDefinition.id);

    // final isFavorites = context.select<FavoritesCubit, bool>(
    //     (value) => value.state.isFavorites(cocktailDefinition.id));

    print('FavoritesButton builder: ${cocktailDefinition.id}');
    final _cubit = BlocProvider.of<FavoritesCubit>(context);
    if (isFavorites) {
      return IconButton(
          onPressed: () {
            _cubit.removeFromFavorites(cocktailDefinition.id);
          },
          icon: Icon(Icons.favorite, color: Colors.red));
    }
    return IconButton(
        onPressed: () {
          _cubit.addToFavorites(cocktailDefinition);
        },
        icon: Icon(Icons.favorite_border));
  }
}
