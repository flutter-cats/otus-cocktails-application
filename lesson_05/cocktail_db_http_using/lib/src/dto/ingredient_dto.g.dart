// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientDto _$IngredientDtoFromJson(Map<String, dynamic> json) {
  return IngredientDto(
    json['idIngredient'] as String?,
    json['strIngredient'] as String?,
    json['strDescription'] as String?,
    json['strType'] as String?,
    json['strAlcohol'] as String?,
    json['strABV'] as String?,
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
