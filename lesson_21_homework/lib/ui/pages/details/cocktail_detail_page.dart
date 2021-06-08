import 'package:flutter/material.dart';
import 'package:lesson_21_animations_homework/core/src/model/cocktail.dart';
import 'package:lesson_21_animations_homework/ui/pages/details/cocktail_description/cocktail_description_widget.dart';
import 'package:lesson_21_animations_homework/ui/pages/details/cocktail_ingredients/ingredients_widget.dart';
import 'package:lesson_21_animations_homework/ui/pages/details/cocktail_instruction/cocktail_instruction.dart';
import 'package:lesson_21_animations_homework/ui/pages/details/cocktail_preview.dart';
import 'package:lesson_21_animations_homework/ui/pages/details/cocktail_rating_bar/cocktail_rating_bar.dart';

class CocktailDetailPage extends StatelessWidget {
  final Cocktail cocktail;

  const CocktailDetailPage(this.cocktail, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CocktailPreview(imageUrl: cocktail.drinkThumbUrl!),
            CocktailDescriptionWidget(cocktail: cocktail),
            CocktailIngredients(cocktailIngredients: cocktail.ingredients!),
            CocktailInstruction(cocktailInstruction: cocktail.instruction!),
            CocktailRatingBar(rating: 3)
          ],
        ),
      ),
    );
  }
}
