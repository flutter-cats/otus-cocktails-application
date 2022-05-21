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
        final List<String> instructionsList = cocktail.instruction.split('.');
        if (instructionsList.last.trim().isEmpty) instructionsList.removeLast();

        Share.share('🍸 Название коктейля: ${cocktail.name}\n' +
            '📊 Категория: ${cocktail.category.value}\n' +
            '🏷️ Тип: ${cocktail.glassType.value}\n' +
            '🛒 Ингредиенты для приготовления: \n${cocktail.ingredients.map((e) => '  ✅ ${e.ingredientName} '
                ': ${e.measure}').join('\n')}\n' +
            '📖 Инструкции для приготовления:\n${instructionsList.map((e) => '  ✅ ${e.trim()}').join('\n')}\n' +
            '🖼️ Ссылка на изображение: ${cocktail.drinkThumbUrl}\n');
      },
      icon: Icon(
        Icons.share,
        color: Colors.white,
      ),
    );
  }
}
