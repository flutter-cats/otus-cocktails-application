import 'package:json_annotation/json_annotation.dart';

part 'ingredient_dto.g.dart';

@JsonSerializable()
class IngredientDto {

  @JsonKey(name: 'idIngredient', required: true)
  final String id;

  @JsonKey(name: 'strIngredient', required: true)
  final String ingredient;

  @JsonKey(name: 'strDescription', required: true)
  final String description;

  @JsonKey(name: 'strType', required: true)
  final String type;

  @JsonKey(name: 'strAlcohol')
  final String? alcohol;

  @JsonKey(name: 'strABV')
  final String? abv;

  IngredientDto({
      required this.id,
      required this.ingredient,
      required this.description,
      required this.type,
      this.alcohol,
      this.abv});

  factory IngredientDto.fromJson(Map<String, dynamic> json) => _$IngredientDtoFromJson(json);
}