//todo
// Отобразить страницу CocktailDetailsScreen из домашнего задания с урока 4
// Получить Cocktail можно из  AsyncCocktailRepository().fetchCocktailDetails(id)

import 'package:flutter/material.dart';
import 'package:homework/core/models.dart';
import 'package:homework/ui/cocktail_description/cocktail_description_widget.dart';
import 'package:homework/ui/cocktail_ingredients/ingredients_widget.dart';
import 'package:homework/ui/cocktail_instruction/cocktail_instruction.dart';
import 'package:homework/ui/cocktail_preview.dart';
import 'package:homework/ui/cocktail_rating_bar/cocktail_rating_bar.dart';

class CocktailDetailsScreen extends StatelessWidget {
  const CocktailDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cocktail = ModalRoute.of(context)!.settings.arguments as Cocktail;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CocktailPreview(imageUrl: cocktail.drinkThumbUrl),
            CocktailDescriptionWidget(cocktail: cocktail),
            CocktailIngredients(cocktailIngredients: cocktail.ingredients),
            CocktailInstruction(cocktailInstruction: cocktail.instruction),
            CocktailRatingBar(rating: 3)
          ],
        ),
      ),
    ));
  }
}
