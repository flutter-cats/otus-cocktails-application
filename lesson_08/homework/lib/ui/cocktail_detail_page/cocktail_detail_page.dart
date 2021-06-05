import 'package:cocktail/core/models.dart';
import 'package:flutter/material.dart';

import 'cocktail_image_widget.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CocktailImage(cocktail.drinkThumbUrl),
            CocktailDescription(
                cocktail.name,
                cocktail.id,
                cocktail.isFavourite,
                cocktail.category.value,
                cocktail.cocktailType.value,
                cocktail.glassType.value),
            IngredientsWidget(cocktail.ingredients),
            InstructionsWidget(cocktail.instruction),
            RatingWidget()
          ],
        ),
      )),
    );
  }
}
