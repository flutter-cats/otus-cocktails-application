import 'package:flutter/material.dart';

import 'models/models.dart';

import 'cocktail_info_section.dart';
import 'cocktail_ingredients_section.dart';
import 'cocktail_instructions_section.dart';
import 'cocktail_rating_section.dart';
import 'image_header_section.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageHeaderSection(
            thumbUrl: cocktail.drinkThumbUrl,
          ),
          CocktailInfoSection(cocktail),
          CocktailIngredientsSection(cocktail),
          CocktailInstructionsSection(
            instruction: cocktail.instruction,
          ),
          CocktailRatingSection(
            rating: 3,
          )
        ],
      ),
    );
  }
}
