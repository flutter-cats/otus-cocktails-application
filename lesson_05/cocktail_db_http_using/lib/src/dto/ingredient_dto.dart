import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createFactory: true, createToJson: false)
class IngreditntDTO {
  final String idIngredient, strIngredient, strDescription, strType, strAlcohol;

  IngreditntDTO(this.idIngredient, this.strAlcohol, this.strDescription,
      this.strIngredient, this.strType) {}

  // factory IngreditntDTO.fromJson(Map<String, dynamic> json) =>
  //     _$IngreditntDTO(json);
}
