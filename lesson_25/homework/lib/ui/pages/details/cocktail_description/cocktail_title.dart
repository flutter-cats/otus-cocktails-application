import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          _getIsFavoriteIcon()
        ],
      );

  Widget _getIsFavoriteIcon() => isFavorite
      ? IconButton(
          icon: Icon(Icons.favorite, color: Colors.white),
          onPressed: () {},
        )
      : IconButton(
          icon: Icon(Icons.favorite_border, color: Colors.white),
          onPressed: () {},
        );
}
