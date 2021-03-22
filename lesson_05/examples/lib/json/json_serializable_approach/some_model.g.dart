// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'some_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SomeModel _$SomeModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['identity', 'name']);
  return SomeModel(
    json['identity'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$SomeModelToJson(SomeModel instance) => <String, dynamic>{
      'identity': instance.id,
      'name': instance.name,
    };
