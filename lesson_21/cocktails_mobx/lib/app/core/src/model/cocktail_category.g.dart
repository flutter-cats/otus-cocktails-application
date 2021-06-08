// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CocktailCategory _$CocktailCategoryFromJson(Map<String, dynamic> json) {
  return CocktailCategory(
    name: json['name'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$CocktailCategoryToJson(CocktailCategory instance) =>
    <String, dynamic>{
      'value': instance.value,
      'name': instance.name,
    };
