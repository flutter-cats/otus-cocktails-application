import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_17/app/bloc_sample/favorites/favorites_cubit.dart';
import 'package:lesson_17/app/core/models.dart';


// Пример реализации через BlocSelector
class FavoritesButtonV3 extends StatelessWidget {
  const FavoritesButtonV3(
    this.cocktailDefinition, {
    Key? key,
  }) : super(key: key);

  final CocktailDefinition cocktailDefinition;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FavoritesCubit, FavoritesState, bool>(
      selector: (state) => state.isFavorites(cocktailDefinition.id),
      builder: (context, isFavorites) {
        print('FavoritesButton builder: ${cocktailDefinition.id}');
        if (isFavorites) {
          return IconButton(
              onPressed: () {
                BlocProvider.of<FavoritesCubit>(context)
                    .removeFromFavorites(cocktailDefinition.id);
              },
              icon: Icon(Icons.favorite, color: Colors.red));
        }
        return IconButton(
            onPressed: () {
              BlocProvider.of<FavoritesCubit>(context)
                  .addToFavorites(cocktailDefinition);
            },
            icon: Icon(Icons.favorite_border));
      },
    );
  }
}
