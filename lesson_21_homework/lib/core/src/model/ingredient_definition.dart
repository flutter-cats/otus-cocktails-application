///
/// Ingredient definition used to describe Cocktail instruction depending on measurement
///
import 'package:hive_flutter/hive_flutter.dart';
part 'ingredient_definition.g.dart';
@HiveType(typeId: 2)
class IngredientDefinition {
  @HiveField(0)
  final String ingredientName;
  @HiveField(1)
  final String? measure;

  IngredientDefinition(this.ingredientName, this.measure);
}
