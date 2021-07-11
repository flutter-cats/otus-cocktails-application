import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';

class CocktailImage extends StatelessWidget {
  const CocktailImage({
    Key key,
    @required this.cocktail,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 343.0,
      child: Image.network(
        cocktail.drinkThumbUrl,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
