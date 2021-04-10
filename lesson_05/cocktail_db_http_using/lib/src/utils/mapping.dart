import 'package:cocktail_app_models/models.dart';
import 'package:cocktail_db_http_using/src/dto/ingredient_dto.dart';

extension IngredientFromDto on IngredientDto {
  Ingredient getIngredient() {
    return Ingredient(
        id: this.id,
        name: this.ingredient,
        description: this.description,
        ingredientType: this.type,
        isAlcoholic: this.alcohol == 'Yes');
  }
}
