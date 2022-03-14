import 'package:json_annotation/json_annotation.dart';

part 'ingredient_dto.g.dart';

@JsonSerializable(createFactory: true, createToJson: false)
class IngredientDto {
  String? idIngredient;
  String? strIngredient;
  String? strDescription;
  String? strType;
  String? strAlcohol;
  String? strABV;

  IngredientDto(
    this.idIngredient,
    this.strIngredient,
    this.strDescription,
    this.strType,
    this.strAlcohol,
    this.strABV,
  );
  
  factory IngredientDto.fromJson(Map<String, dynamic> json) => _$IngredientDtoFromJson(json);
}
