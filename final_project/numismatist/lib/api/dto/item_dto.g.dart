// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDto _$ItemDtoFromJson(Map<String, dynamic> json) => ItemDto(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      nominal: json['nominal'] as num,
      currency: json['currency'] as int,
      material: json['material'] as String,
      weight: json['weight'] as num?,
      circulation: json['circulation'] as int?,
      years: (json['years'] as List<dynamic>?)?.map((e) => e as int).toList(),
      facilities: (json['facilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastUpdate: json['lastUpdate'] as String?,
      averse: json['averse'] as String?,
      reverse: json['reverse'] as String?,
    );

Map<String, dynamic> _$ItemDtoToJson(ItemDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'nominal': instance.nominal,
      'currency': instance.currency,
      'material': instance.material,
      'weight': instance.weight,
      'circulation': instance.circulation,
      'years': instance.years,
      'facilities': instance.facilities,
      'lastUpdate': instance.lastUpdate,
      'averse': instance.averse,
      'reverse': instance.reverse,
    };
