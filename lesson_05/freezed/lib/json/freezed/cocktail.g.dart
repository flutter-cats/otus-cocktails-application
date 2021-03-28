// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cocktail _$_$_CocktailFromJson(Map<String, dynamic> json) {
  return _$_Cocktail(
    id: json['id'] as String?,
    drink: json['drink'] as String?,
    category: json['category'] as String?,
    alcoholic: json['alcoholic'] as String?,
    glass: json['strGlass'] as String?,
  );
}

Map<String, dynamic> _$_$_CocktailToJson(_$_Cocktail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'drink': instance.drink,
      'category': instance.category,
      'alcoholic': instance.alcoholic,
      'strGlass': instance.glass,
    };
