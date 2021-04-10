import 'package:json_annotation/json_annotation.dart';

part 'ingredient_dto.g.dart';

@JsonSerializable(createFactory: true, createToJson: false)
class IngredientDto {
  @JsonKey(name: 'idIngredient', required: true)
  final String? id;

  @JsonKey(name: 'strIngredient', required: true)
  final String? name;

  @JsonKey(name: 'strType')
  final String? ingredientType;

  @JsonKey(name: 'strDescription')
  final String? description;

  @JsonKey(name: 'strAlcohol', fromJson: _isAlcoholicConvert)
  final bool? isAlcoholic;

  IngredientDto({
    this.id,
    this.name,
    this.ingredientType,
    this.description,
    this.isAlcoholic,
  });

  static bool _isAlcoholicConvert(String value) => value == 'Yes';

  factory IngredientDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientDtoFromJson(json);
}
