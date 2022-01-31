import 'package:lesson_21_animations_homework/core/models.dart';

class CocktailDefinitionFavorite extends CocktailDefinition {
  CocktailDefinitionFavorite(CocktailDefinition cocktailDefinition)
      : super(
          id: cocktailDefinition.id,
          drinkThumbUrl: cocktailDefinition.drinkThumbUrl,
          isFavourite: true,
          name: cocktailDefinition.name,
        );
}
