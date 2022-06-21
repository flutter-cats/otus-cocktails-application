import 'dart:typed_data';
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:numismatist/api/dto/item_dto.dart';

import 'package:numismatist/core/const.dart';
import 'package:numismatist/repository/models/currency.dart';

part 'item.g.dart';

@HiveType(typeId: HiveConst.item)
class Item {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String catalogId;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final num nominal;
  @HiveField(5)
  final Currency currency;
  @HiveField(6)
  final String material;
  @HiveField(7)
  final num? weight;
  @HiveField(8)
  final int? circulation;
  @HiveField(9)
  final List<int> years;
  @HiveField(10)
  final List<String> facilities;
  @HiveField(11)
  final DateTime lastUpdate;
  @HiveField(12)
  final Uint8List? averse;
  @HiveField(13)
  final Uint8List? reverse;

  Item({
    required this.id,
    required this.catalogId,
    required this.name,
    required this.description,
    required this.nominal,
    required this.currency,
    required this.material,
    this.weight,
    this.circulation,
    this.years = const [],
    this.facilities = const [],
    required this.lastUpdate,
    this.averse,
    this.reverse,
  });

  static Item createFromDto(ItemDto dto, String catalogId) {
    return Item(
      id: dto.id,
      catalogId: catalogId,
      name: dto.name,
      description: dto.description ?? "",
      nominal: dto.nominal,
      currency: CurrencyConst.parse(dto.currency),
      material: dto.material,
      weight: dto.weight ?? 0,
      circulation: dto.circulation ?? 0,
      years: dto.years ?? [],
      facilities: dto.facilities ?? [],
      lastUpdate: DateTime.tryParse(dto.lastUpdate ?? "") ?? DateTime.now(),
      averse: base64.decode(dto.averse ?? ""),
      reverse: base64.decode(dto.reverse ?? ""),
    );
  }
}
