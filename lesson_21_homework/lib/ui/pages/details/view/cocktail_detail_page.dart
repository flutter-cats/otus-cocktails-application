import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import '../../../../core/src/model/cocktail.dart';
import 'cocktail_detail_widgets.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key? key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: ListView(
        children: [
          CocktailImageWidget(
            width: width,
            cocktailImageUrl: cocktail.drinkThumbUrl,
            cocktailId: cocktail.id,
          ),
          DescriptionWidget(
            cocktailName: cocktail.name,
            cocktailId: cocktail.id,
            cocktailImageUrl: cocktail.drinkThumbUrl,
            glassType: cocktail.glassType.value,
            cocktailCategory: cocktail.category.value,
            cocktailType: cocktail.cocktailType.value,
          ),
          IngredientsWidget(ingredients: cocktail.ingredients),
          InstructionsWidget(instructions: cocktail.instruction),
          RatingWidget(id: cocktail.id),
        ],
      ),
    );
  }
}
