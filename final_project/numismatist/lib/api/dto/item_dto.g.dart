// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDto _$ItemDtoFromJson(Map<String, dynamic> json) => ItemDto(
      id: json['Id'] as String,
      name: json['Name'] as String,
      description: json['Description'] as String?,
      nominal: json['Nominal'] as num,
      currency: json['Currency'] as int,
      material: json['Material'] as String,
      weight: json['Weight'] as num?,
      circulation: json['Circulation'] as int?,
      years: (json['Years'] as List<dynamic>?)?.map((e) => e as int).toList(),
      facilities: (json['Facilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastUpdate: json['LastUpdate'] as String?,
      averse: json['Averse'] as String?,
      reverse: json['Reverse'] as String?,
    );

Map<String, dynamic> _$ItemDtoToJson(ItemDto instance) => <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Description': instance.description,
      'Nominal': instance.nominal,
      'Currency': instance.currency,
      'Material': instance.material,
      'Weight': instance.weight,
      'Circulation': instance.circulation,
      'Years': instance.years,
      'Facilities': instance.facilities,
      'LastUpdate': instance.lastUpdate,
      'Averse': instance.averse,
      'Reverse': instance.reverse,
    };
