import 'dart:core';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

part 'item_dto.g.dart';

@JsonSerializable()
class ItemDto {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "nominal")
  final num nominal;
  @JsonKey(name: "currency")
  final int currency;
  @JsonKey(name: "material")
  final String material;
  @JsonKey(name: "weight")
  final num? weight;
  @JsonKey(name: "circulation")
  final int? circulation;
  @JsonKey(name: "years")
  final List<int>? years;
  @JsonKey(name: "facilities")
  final List<String>? facilities;
  @JsonKey(name: "lastUpdate")
  final String? lastUpdate;
  @JsonKey(name: "averse")
  final String? averse;
  @JsonKey(name: "reverse")
  final String? reverse;

  ItemDto({
    required this.id,
    required this.name,
    this.description,
    required this.nominal,
    required this.currency,
    required this.material,
    this.weight,
    this.circulation,
    this.years,
    this.facilities,
    this.lastUpdate,
    this.averse,
    this.reverse,
  });

  Map<String, dynamic> toJson() => _$ItemDtoToJson(this);
  factory ItemDto.fromJson(Map<String, dynamic> json) => _$ItemDtoFromJson(json);
}
