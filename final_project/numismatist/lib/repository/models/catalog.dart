import 'package:hive_flutter/hive_flutter.dart';
import 'package:numismatist/api/dto/catalog_dto.dart';

import 'package:numismatist/core/const.dart';

part 'catalog.g.dart';

@HiveType(typeId: HiveConst.catalog)
class Catalog {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime lastUpdate;
  @HiveField(4)
  final List<String> items;

  Catalog({
    required this.id,
    required this.name,
    required this.description,
    required this.lastUpdate,
    required this.items,
  });

  static Catalog createFromDto(CatalogDto dto) {
    return Catalog(
      id: dto.id,
      name: dto.name ?? "",
      description: dto.description ?? "",
      lastUpdate: DateTime.tryParse(dto.lastUpdate ?? "") ?? DateTime.now(),
      items: dto.items ?? [],
    );
  }
}
