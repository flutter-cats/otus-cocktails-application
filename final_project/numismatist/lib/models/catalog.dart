import 'package:hive_flutter/hive_flutter.dart';

import 'package:numismatist/core/const.dart';

part 'catalog.g.dart';

@HiveType(typeId: HiveConst.catalog)
class Catalog {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime lastUpdate;
  @HiveField(4)
  final List<int> items;

  Catalog({
    required this.id,
    required this.name,
    required this.description,
    required this.lastUpdate,
    required this.items,
  });

  // static Catalog createFromDto(CatalogDto dto) {
  //   return File(id: dto.id, fileName: dto.fileName ?? dto.content ?? "", contentType: dto.contentType ?? "", fileDownloadUrl: dto.fileDownloadUrl);
  // }
}
