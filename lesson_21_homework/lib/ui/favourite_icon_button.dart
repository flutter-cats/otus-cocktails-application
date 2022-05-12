import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/src/model/cocktail_definition.dart';
import 'animated_heart_icon_button.dart';
import 'pages/favourites/cubit/favourites_cubit.dart';

class FavouriteIconButton extends StatelessWidget {
  const FavouriteIconButton(this.cocktailDefinition, {Key? key})
      : super(key: key);

  final CocktailDefinition cocktailDefinition;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        final favouritesCubit = context.read<FavouritesCubit>();
        final isCocktailFavourite =
            state.isCocktailFavorite(cocktailDefinition.id);
        return AnimatedHeartIconButton(
          isFavourite: isCocktailFavourite,
          onTap: () {
            if (isCocktailFavourite) {
              favouritesCubit.removeFromFavourite(cocktailDefinition.id);
            } else {
              favouritesCubit.addToFavourite(cocktailDefinition);
            }
          },
        );
      },
    );
  }
}
