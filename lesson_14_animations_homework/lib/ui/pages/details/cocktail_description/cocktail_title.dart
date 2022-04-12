import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson_14_animations_homework/ui/components/FavoriteButton.dart';

class CocktailTitle extends StatelessWidget {
  final String cocktailTitle;
  final bool isFavorite;

  CocktailTitle({
    required this.cocktailTitle,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            cocktailTitle,
            style: Theme.of(context).textTheme.headline3,
          ),
          FavoriteButton(isFavorite: isFavorite)
        ],
      );
}
