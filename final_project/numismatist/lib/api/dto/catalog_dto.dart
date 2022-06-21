import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'catalog_dto.g.dart';

@JsonSerializable()
class CatalogDto {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "lastUpdate")
  final String? lastUpdate;
  @JsonKey(name: "items")
  final List<String>? items;

  CatalogDto({
    required this.id,
    this.name,
    this.description,
    this.lastUpdate,
    this.items,
  });

  Map<String, dynamic> toJson() => _$CatalogDtoToJson(this);
  factory CatalogDto.fromJson(Map<String, dynamic> json) => _$CatalogDtoFromJson(json);
}
