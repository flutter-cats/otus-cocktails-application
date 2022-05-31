import 'package:json_annotation/json_annotation.dart';

part 'ingredients_dto.g.dart';


@JsonSerializable(createFactory: true, createToJson: false)
class IngredientsDto {
  final String? idIngredient;
  final String? strIngredient;
  final String? strDescription;
  final String? strType;
  final String? strAlcohol;
  final String? strABV;

 IngredientsDto(this.idIngredient, this.strIngredient, this.strDescription,
 this.strType, this.strAlcohol, this.strABV);

  factory IngredientsDto.fromJson(Map<String, dynamic> json) => _$IngredientsDtoFromJson(json);
}
