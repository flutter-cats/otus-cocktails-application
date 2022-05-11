import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/src/model/cocktail_definition.dart';
import 'animated_heart_icon_button.dart';
import 'pages/favourites/cubit/favourites_cubit.dart';

class FavouriteIconButton extends StatelessWidget {
  const FavouriteIconButton({Key? key, required this.cocktail})
      : super(key: key);

  final CocktailDefinition cocktail;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        final favouritesCubit = context.read<FavouritesCubit>();
        final isFavourite = favouritesCubit.isFavorite(cocktail.id);
        return AnimatedHeartIconButton(
          isFavourite: isFavourite,
          onTap: () {
            if (isFavourite) {
              favouritesCubit.removeFromFavourite(cocktail);
            } else {
              favouritesCubit.addToFavourite(cocktail);
            }
          },
        );
      },
    );
  }
}
