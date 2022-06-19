import 'package:equatable/equatable.dart';

///
/// Ingredient definition used to describe Cocktail instruction depending on measurement
///
class IngredientDefinition extends Equatable {
  final String ingredientName;
  final String? measure;

  IngredientDefinition(this.ingredientName, this.measure);

  @override
  List<Object?> get props => [ingredientName, measure];
}
