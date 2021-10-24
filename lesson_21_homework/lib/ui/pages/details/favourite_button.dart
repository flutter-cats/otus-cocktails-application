import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:lesson_21_animations_homework/core/data/HiveBoxes.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/core/src/repository/FavouriteCocktailsStore.dart';
import 'package:provider/provider.dart';

class FavouriteButtonWidget extends StatelessWidget {
  final CocktailDefinition definition;

  FavouriteButtonWidget(this.definition) {
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) {
      final favCocktailsStore = Provider.of<FavouriteCocktailsStore>(context);

      final isFav = favCocktailsStore.isFavorite(definition.id ?? '');
      return Semantics(
          label: 'Favorite Icon button',
          hint: 'Press to favorite',
          value: isFav.toString(),
          child: isFav
              ? IconButton(
                  icon: Icon(Icons.favorite, color: Colors.white),
                  onPressed: () {
                    favCocktailsStore.removeCocktail(definition);
                  },
                )
              : IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.white),
                  onPressed: () {
                    favCocktailsStore.addCocktail(definition);
                  },
                ));
    });
  }
}
