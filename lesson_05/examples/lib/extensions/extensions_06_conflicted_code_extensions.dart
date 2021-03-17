import 'package:cocktail_app_models/models.dart';

extension fromJsonExtension on Map<String, dynamic> {
  Cocktail toCocktail() => Cocktail(
        id: this['idDrink'] as String,
        name: this['strDrink'] as String,
        instruction: this['strInstructions'] as String,
      );
}
