import 'package:flutter/material.dart';
import 'package:homework/components/cocktail_header.dart';
import 'package:homework/components/cocktail_ingredients.dart';
import 'package:homework/components/cocktail_instruction.dart';
import 'package:homework/components/cocktail_stars.dart';
import 'package:homework/components/cocktail_title.dart';
import 'package:homework/models/models.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
      this.cocktail, {
        Key key,
      }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CocktailHeader(
              url: cocktail.drinkThumbUrl
            ),
            CocktailTitle(
              id: cocktail.id,
              name: cocktail.name,
              isFavourite: cocktail.isFavourite,
              category: cocktail.category,
              cocktailType: cocktail.cocktailType,
              glassType: cocktail.glassType,
            ),
            CocktailIngredients(
              ingredients: cocktail.ingredients,
            ),
            CocktailInstruction(
              instruction: cocktail.instruction,
            ),
            CocktailStars(
              rating: 3,
            )
          ],
        ),
      ),
    );
  }
}
