// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingridient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngridientDto _$IngridientDtoFromJson(Map<String, dynamic> json) {
  return IngridientDto(
    json['idIngredient'] as String?,
    json['strIngredient'] as String?,
    json['strDescription'] as String?,
    json['strType'] as String?,
    json['strAlcohol'] as String?,
    json['strABV'] as String?,
  );
}

Map<String, dynamic> _$IngridientDtoToJson(IngridientDto instance) =>
    <String, dynamic>{
      'idIngredient': instance.idIngredient,
      'strIngredient': instance.strIngredient,
      'strDescription': instance.strDescription,
      'strType': instance.strType,
      'strAlcohol': instance.strAlcohol,
      'strABV': instance.strABV,
    };
