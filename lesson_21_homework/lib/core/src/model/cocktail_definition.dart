import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:meta/meta.dart';

class CocktailDefinition {
  final String? id;
  final String? name;
  final String? drinkThumbUrl;
  final bool? isFavourite;

  CocktailDefinition({
    @required this.id,
    @required this.name,
    @required this.drinkThumbUrl,
    @required this.isFavourite,
  });

  CocktailDefinitionDto toDto() {
    return CocktailDefinitionDto(this.name!, this.drinkThumbUrl!, this.id!);
  }

  factory CocktailDefinition.fromDto(CocktailDefinitionDto dto) =>
      CocktailDefinition(
        id: dto.idDrink,
        name: dto.strDrink,
        drinkThumbUrl: dto.strDrinkThumb,
        isFavourite: false,
      );
}
