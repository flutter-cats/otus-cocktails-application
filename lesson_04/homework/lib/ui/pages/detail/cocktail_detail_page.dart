import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../state_widget.dart';
import '../../../models/models.dart';
import '../../../models/res/app_colors.dart';
import 'cocktail_detail_widgets.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key? key,
    required this.rating,
  }) : super(key: key);

  final Cocktail cocktail;
  final int rating;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return StateWidget(
      isFavourite: cocktail.isFavourite,
      rating: rating,
      child: Container(
        color: AppColors.background,
        child: SafeArea(
          child: ListView(
            children: [
              CocktailImageWidget(
                width: width,
                cocktailImageUrl: cocktail.drinkThumbUrl,
              ),
              DescriptionWidget(
                cocktailName: cocktail.name,
                cocktailId: cocktail.id,
                glassType: cocktail.glassType.value,
                cocktailCategory: cocktail.category.value,
                cocktailType: cocktail.cocktailType.value,
              ),
              IngredientsWidget(ingredients: cocktail.ingredients),
              InstructionsWidget(instructions: cocktail.instruction),
              const RatingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
