import 'package:cocktail_app_tests/ui/application_semantics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cocktail_app_tests/core/cocktails_favorites.dart';
import 'package:cocktail_app_tests/core/src/model/cocktail_definition.dart';
import 'package:provider/provider.dart';

class CocktailFavoriteButton extends StatelessWidget {
  final CocktailDefinition cocktailDefinition;

  const CocktailFavoriteButton(this.cocktailDefinition, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = cocktailDefinition.id!;
    final isFavorite = cocktailDefinition.isFavourite == true;
    return Container(
      height: 24,
      width: 24,
      child: Observer(
        builder: (_) => Semantics(
          label: !isFavorite ? ApplicationSemantics.cocktailIsFavoriteButton : ApplicationSemantics.cocktailIsNotFavoriteButton,
          child: IconButton(
            padding: const EdgeInsets.all(0),
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () {
              final favorites = Provider.of<CocktailsFavorites>(context);
              if (favorites.isFavorite(id))
                favorites.removeFromFavorites(id);
              else
                favorites.addToFavorite(cocktailDefinition);
            },
          ),
        ),
      ),
    );
  }
}
