import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lesson_21_animations_homework/core/cocktails_favorites.dart';
import 'package:lesson_21_animations_homework/core/src/model/cocktail_definition.dart';
import 'package:provider/provider.dart';

class CocktailFavoriteButton extends StatelessWidget {
  final CocktailDefinition cocktailDefinition;

  const CocktailFavoriteButton(this.cocktailDefinition, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<CocktailsFavorites>(context);
    final id = cocktailDefinition.id!;

    return Container(
      height: 24,
      width: 24,
      child: Observer(
        builder: (_) => IconButton(
          padding: const EdgeInsets.all(0),
          icon: Icon(favorites.isFavorite(id) ? Icons.favorite : Icons.favorite_border, color: Colors.white),
          onPressed: () {
            if (favorites.isFavorite(id))
              favorites.removeFromFavorites(id);
            else
              favorites.addToFavorite(cocktailDefinition);
          },
        ),
      ),
    );
  }
}
