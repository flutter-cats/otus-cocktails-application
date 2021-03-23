// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientDto _$IngredientDtoFromJson(Map<String, dynamic> json) {
  return IngredientDto(
    idIngredient: json['idIngredient'] as String,
    strIngredient: json['strIngredient'] as String,
    strDescription: json['strDescription'] as String,
    strType: json['strType'] as String,
    strAlcohol: json['strAlcohol'] as bool?,
    strABV: json['strABV'] as String?,
  );
}

Map<String, dynamic> _$IngredientDtoToJson(IngredientDto instance) =>
    <String, dynamic>{
      'idIngredient': instance.idIngredient,
      'strIngredient': instance.strIngredient,
      'strDescription': instance.strDescription,
      'strType': instance.strType,
      'strAlcohol': instance.strAlcohol,
      'strABV': instance.strABV,
    };
