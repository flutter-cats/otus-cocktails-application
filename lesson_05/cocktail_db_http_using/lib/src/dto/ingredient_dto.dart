import 'package:json_annotation/json_annotation.dart';

part 'ingredient_dto.g.dart';

@JsonSerializable(createFactory: true, createToJson: false)
class IngredientDto {
  final String? idIngredient;
  final String? strIngredient;
  final String? strDescription;
  final String? strType;
  final bool? strAlcohol;

  IngredientDto(
      this.idIngredient,
      this.strIngredient,
      this.strDescription,
      this.strType,
      this.strAlcohol
      );

  factory IngredientDto.fromJson(Map<String, dynamic> json) => _$IngredientDtoFromJson(json);
}
