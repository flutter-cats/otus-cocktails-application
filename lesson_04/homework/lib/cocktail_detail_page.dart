import 'package:flutter/material.dart';
import 'package:homework/components/cocktail_description.dart';
import 'package:homework/components/cocktail_image_widget.dart';
import 'package:homework/components/cocktail_ingridiets.dart';
import 'package:homework/components/cocktail_instruction.dart';
import 'package:homework/components/cocktail_ranked_widget.dart';
import 'package:homework/models/models.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CoctailImageWidget(
                imageUrl: cocktail.drinkThumbUrl,
              ),
              CoctailDescriptionWidget(
                id: cocktail.id,
                name: cocktail.name,
                category: cocktail.category.value,
                type: cocktail.cocktailType.value,
                glassType: cocktail.glassType.value,
              ),
              CocktailIngredientsWidgets(
                allIngredients: cocktail.ingredients,
              ),
              CoctailInstructionWidget(
                instruction: cocktail.instruction,
              ),
              CocktailRankBarWidget(),
            ],
          ),
        ),
      ),
    );

    /// TODO: Сделать верстку экрана "Карточка коктейля" по модели Cocktail cocktail
    /// Ссылка на макет
    /// https://www.figma.com/file/d2JJUBFu7Dg0HOV30XG7Z4/OTUS-FLUTTER.-%D0%A3%D1%80%D0%BE%D0%BA-3-%D0%94%D0%97?node-id=23%3A85
    ///для того чтобы весь контент поместился, необходимо использовать SingleChildScrollView()
    ///
    ///
  }
}
