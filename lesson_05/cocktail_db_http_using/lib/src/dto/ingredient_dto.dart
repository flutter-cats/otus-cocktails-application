import 'package:json_annotation/json_annotation.dart';

part 'ingredient_dto.g.dart';

@JsonSerializable(createFactory: true, createToJson: false)
class IngredientDto {
  late final String? idIngredient;
  late final String? strIngredient;
  late final String? strDescription;
  late final String? strType;
  late final String? strAlcohol;
  late final String? strABV;

  IngredientDto(
      this.idIngredient,
      this.strIngredient,
      this.strDescription,
      this.strType,
      this.strAlcohol,
      this.strABV
  );

  factory IngredientDto.fromJson(Map<String, dynamic> json) => _$IngredientDtoFromJson(json);
}