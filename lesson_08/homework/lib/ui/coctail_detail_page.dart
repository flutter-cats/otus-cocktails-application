import 'package:flutter/material.dart';
import 'package:cocktail/components/ingredients_widget.dart';
import 'package:cocktail/components/instruction_widget.dart';
import 'package:cocktail/components/rank_bar_widget.dart';
import 'package:cocktail/core/models.dart';
import 'package:cocktail/components/description_widget.dart';
import 'package:cocktail/components/image_widget.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
      this.cocktail, {
        Key key,
      }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    /// Делаем верстку экрана "Карточка коктейля" по модели Cocktail cocktail
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageWidget(
                imageUrl: cocktail.drinkThumbUrl,
              ),
              DescriptionWidget(
                id: cocktail.id,
                name: cocktail.name,
                category: cocktail.category.value,
                type: cocktail.cocktailType.value,
                glassType: cocktail.glassType.value,
              ),
              IngredientsWidgets(
                allIngredients: cocktail.ingredients,
              ),
              InstructionWidget(
                instruction: cocktail.instruction,
              ),
              RankBarWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
