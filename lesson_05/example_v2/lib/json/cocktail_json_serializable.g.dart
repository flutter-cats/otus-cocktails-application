// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_json_serializable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cocktail _$CocktailFromJson(Map<String, dynamic> json) {
  return Cocktail(
    id: json['id'] as String,
    name: json['name'] as String?,
    drinkThumbUrl: json['drinkThumbUrl'] as String?,
    isFavourite: json['isFavourite'] as bool?,
    cocktail: json['cocktail'] == null ? null : Cocktail.fromJson(json['cocktail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CocktailToJson(Cocktail instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'drinkThumbUrl': instance.drinkThumbUrl,
      'isFavourite': instance.isFavourite,
      'cocktail': instance.cocktail,
    };
