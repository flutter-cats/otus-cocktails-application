import 'package:json_annotation/json_annotation.dart';

part 'cocktail_ingredient_dto.g.dart';

@JsonSerializable(createFactory: true)
class IngredientDto {
  IngredientDto(
      {this.idIngredient,
      this.strIngredient,
      this.strDescription,
      this.strType,
      this.strAlcohol,
      this.strABV});

  final String? idIngredient;
  final String? strIngredient;
  final String? strDescription;
  final String? strType;
  final bool? strAlcohol;
  final String? strABV;

  factory IngredientDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientDtoToJson(this);
}
