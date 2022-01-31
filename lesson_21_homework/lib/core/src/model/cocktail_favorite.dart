import 'package:lesson_21_animations_homework/core/models.dart';

class CocktailFavorite extends Cocktail {
  CocktailFavorite(Cocktail cocktail)
      : super(
          category: cocktail.category,
          cocktailType: cocktail.cocktailType,
          isFavourite: true,
          ingredients: cocktail.ingredients,
          instruction: cocktail.instruction,
          glassType: cocktail.glassType,
          name: cocktail.name,
          drinkThumbUrl: cocktail.drinkThumbUrl,
          id: cocktail.id,
        );
}
