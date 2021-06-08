import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cocktails_mobx/app/core/models.dart';
import 'package:cocktails_mobx/app/state/favorites/favorites_store.dart';
import 'package:provider/provider.dart';

class FavoritesButton extends StatelessWidget {
  const FavoritesButton(
    this.cocktailDefinition, {
    Key? key,
  }) : super(key: key);

  final CocktailDefinition cocktailDefinition;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final favoritesStore = Provider.of<FavoritesStore>(context);

        if (favoritesStore.isFavorite(cocktailDefinition.id)) {
          return IconButton(
              onPressed: () {
                favoritesStore.removeFromFavorites(cocktailDefinition.id);
              },
              icon: Icon(Icons.favorite, color: Colors.red));
        }
        return IconButton(
            onPressed: () {
              favoritesStore.addToFavorites(cocktailDefinition);
            },
            icon: Icon(Icons.favorite_border));
      },
    );
  }
}
