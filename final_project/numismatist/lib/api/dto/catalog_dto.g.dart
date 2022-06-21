// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogDto _$CatalogDtoFromJson(Map<String, dynamic> json) => CatalogDto(
      id: json['id'] as String,
      name: json['name'] as String?,
      description: json['description'] as String?,
      lastUpdate: json['lastUpdate'] as String?,
      items:
          (json['items'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CatalogDtoToJson(CatalogDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'lastUpdate': instance.lastUpdate,
      'items': instance.items,
    };
