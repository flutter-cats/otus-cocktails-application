import 'package:cocktail_app/core/models.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class CocktailShareIconButton extends StatelessWidget {
  const CocktailShareIconButton({Key? key, required this.cocktail})
      : super(key: key);
  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        String ingredients = '';
        final List<IngredientDefinition> ingredientList =
            cocktail.ingredients.toList();
        for (var index = 0; index < ingredientList.length; ++index) {
          ingredients +=
              '${index + 1}. ${ingredientList.elementAt(index).ingredientName} '
              ': ${ingredientList.elementAt(index).measure},\n';
        }

        Share.share("Коктейль: ${cocktail.name}\n" +
            "Категория: ${cocktail.category.value}\n" +
            "Тип: ${cocktail.glassType.value}\n" +
            "Ингредиенты для приготовления: \n" +
            ingredients +
            "Инструкции для приготовления: ${cocktail.instruction}\n" +
            "Ссылка на изображение: ${cocktail.drinkThumbUrl}\n");
      },
      icon: Icon(
        Icons.share,
        color: Colors.white,
      ),
    );
  }
}
