import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/animated_like.dart';

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
          _getIsFavoriteIcon(isFavorite)
        ],
      );

  Widget _getIsFavoriteIcon(bool isFavourite) => AnimatedLike(
    isFavourite: isFavourite,
  );
}
