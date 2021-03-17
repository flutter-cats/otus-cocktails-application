import 'package:flutter/material.dart';
import 'package:homework/custom_widgets/cocktail_details/CocktailImageWidget.dart';
import 'package:homework/custom_widgets/cocktail_details/CocktailInstructionWidget.dart';
import 'package:homework/custom_widgets/cocktail_details/RatingBarWidget.dart';
import 'package:homework/models/models.dart';
import 'custom_widgets/cocktail_details/CocktailIngredientWidget.dart';
import 'custom_widgets/cocktail_details/CoctailDescritionWidget.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
      this.cocktail, {
        Key key,
      }) : super(key: key);

  final Cocktail cocktail;
  final int rating = 3;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            CocktailImageWidget(cocktail.drinkThumbUrl),
            CocktailDescriptionWidget(
                cocktail.name,
                cocktail.id,
                cocktail.isFavourite,
                cocktail.category,
                cocktail.cocktailType,
                cocktail.glassType),
            CocktailIngredientWidget(cocktail),
            CocktailInstructionWidget(cocktail),
            RatingBarWidget(rating)
          ],
        ));
  }
}
