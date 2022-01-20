import 'package:json_annotation/json_annotation.dart';

part 'ingredient_definition_dto.g.dart';

@JsonSerializable(createFactory: true, createToJson: false)
class IngredientDefinitionDto {
  final String idIngredient;
  final String strIngredient;
  final String strDescription;
  final String strType;
  final bool strAlcohol;

  IngredientDefinitionDto(this.idIngredient, this.strIngredient, this.strDescription, this.strType, this.strAlcohol);

  factory IngredientDefinitionDto.fromJson(Map<String, dynamic> json) => _$IngredientDefinitionDtoFromJson(json);
}
