import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/src/model/cocktail_definition.dart';
import 'animated_heart_icon_button.dart';
import 'favourites/cubit/favourites_cubit.dart';

class FavouriteIconButton extends StatelessWidget {
  const FavouriteIconButton(this.cocktailDefinition, {Key? key})
      : super(key: key);

  final CocktailDefinition cocktailDefinition;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        switch (state.status) {
          case FavouritesStatus.initial:
          case FavouritesStatus.loading:
          case FavouritesStatus.failure:
            return const AnimatedHeartIconButton(
              isFavourite: false,
            );
          case FavouritesStatus.empty:
          case FavouritesStatus.success:
            final favouritesCubit = context.read<FavouritesCubit>();
            final isCocktailFavourite =
                favouritesCubit.isCocktailFavorite(cocktailDefinition);
            return AnimatedHeartIconButton(
              isFavourite: isCocktailFavourite,
              onTap: () {
                favouritesCubit.toggleFavourite(cocktailDefinition);
              },
            );
        }
      },
    );
  }
}
