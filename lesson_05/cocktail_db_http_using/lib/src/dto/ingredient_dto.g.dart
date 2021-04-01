// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientDto _$IngredientDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'idIngredient',
    'strIngredient',
    'strDescription',
    'strType'
  ]);
  return IngredientDto(
    id: json['idIngredient'] as String,
    ingredient: json['strIngredient'] as String,
    description: json['strDescription'] as String,
    type: json['strType'] as String,
    alcohol: json['strAlcohol'] as String?,
    abv: json['strABV'] as String?,
  );
}

Map<String, dynamic> _$IngredientDtoToJson(IngredientDto instance) =>
    <String, dynamic>{
      'idIngredient': instance.id,
      'strIngredient': instance.ingredient,
      'strDescription': instance.description,
      'strType': instance.type,
      'strAlcohol': instance.alcohol,
      'strABV': instance.abv,
    };
