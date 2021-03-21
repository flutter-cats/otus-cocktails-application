import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:homework/ui/cocktail_detail_page/cocktail_description_widget.dart';
import 'package:homework/ui/cocktail_detail_page/cocktail_image_widget.dart';
import 'package:homework/ui/cocktail_detail_page/ingredients_widget.dart';
import 'package:homework/ui/cocktail_detail_page/instruction_widget.dart';

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
            InstructionsWidget(cocktail.instruction)
          ],
        ),
      )),
    );
  }
}
