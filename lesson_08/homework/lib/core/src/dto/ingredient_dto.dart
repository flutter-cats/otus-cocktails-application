import 'package:json_annotation/json_annotation.dart';

part 'ingredient_dto.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class IngredientDto {
  final String? idIngredient;
  final String? strIngredient;
  final String? strDescription;
  final String? strType;
  @JsonKey(name: 'strAlcohol', fromJson: _boolFromString, toJson: _boolToString)
  final bool? isAlcoholic;
  final String? strABV;

  static bool? _boolFromString(String? strAlcohol) => strAlcohol == 'Yes';
  static String? _boolToString(bool? strAlcohol) => strAlcohol! ? 'Yes' : null;

  IngredientDto(this.idIngredient, this.strIngredient, this.strDescription,
      this.strType, this.isAlcoholic, this.strABV);

  factory IngredientDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientDtoFromJson(json);

  //for training
  Map<String, dynamic> toJson() => _$IngredientDtoToJson(this);
}
