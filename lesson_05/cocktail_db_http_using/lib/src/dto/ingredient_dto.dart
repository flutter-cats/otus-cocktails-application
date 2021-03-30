import 'package:json_annotation/json_annotation.dart';

part 'ingredient_dto.g.dart';

@JsonSerializable()
class IngredientDto {
  final String idIngredient;
  final String strIngredient;
  final String strDescription;
  final String strType;
  final String? strAlcohol;
  final String? strABV;

  IngredientDto({
    required this.idIngredient,
    required this.strIngredient,
    required this.strDescription,
    required this.strType,
    this.strAlcohol,
    this.strABV,
  });

  factory IngredientDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientDtoToJson(this);
}
