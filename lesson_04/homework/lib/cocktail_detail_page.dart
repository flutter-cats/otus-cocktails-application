import 'package:flutter/material.dart';
import 'components/ingredients_widget.dart';
import 'components/instruction_widget.dart';
import 'components/rank_bar_widget.dart';
import 'models/models.dart';
import 'components/description_widget.dart';
import 'components/image_widget.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
      this.cocktail, {
        Key key,
      }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    /// TODO: Сделать верстку экрана "Карточка коктейля" по модели Cocktail cocktail
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
