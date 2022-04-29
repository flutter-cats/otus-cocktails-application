import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_21_animations_homework/bloc/favorties/favorites_cubit.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton(this.cocktailDefinition, {Key? key}) : super(key: key);

  final CocktailDefinition cocktailDefinition;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final _cubit = BlocProvider.of<FavoritesCubit>(context);
        if (state.isFavorites(cocktailDefinition.id!)) {
          return IconButton(
              onPressed: () {
                _cubit.removeFromFavorites(cocktailDefinition.id!);
              },
              icon: Icon(Icons.favorite, color: Colors.red));
        }
        return IconButton(
            onPressed: () {
              _cubit.addToFavorites(cocktailDefinition.toDto());
            },
            icon: Icon(Icons.favorite_border, color: Colors.white));
      },
    );
  }
}
