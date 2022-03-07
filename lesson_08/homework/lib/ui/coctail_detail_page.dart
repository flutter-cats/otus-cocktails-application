import 'package:flutter/material.dart';
import 'components/cocktail_header.dart';
import 'components/cocktail_ingredients.dart';
import 'components/cocktail_instruction.dart';
import 'components/cocktail_stars.dart';
import 'components/cocktail_title.dart';

import '../core/src/model/cocktail.dart';

class CocktailDetailPage extends StatelessWidget {
  final Cocktail cocktail;

  const CocktailDetailPage(
      {
        required this.cocktail,
        Key? key,
      }) : super(key: key);

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
