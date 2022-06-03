import 'package:hive_flutter/hive_flutter.dart';

import 'package:numismatist/core/const.dart';

part 'item.g.dart';

@HiveType(typeId: HiveConst.item)
class Item {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String currency;
  @HiveField(4)
  final num nominal;
  @HiveField(5)
  final int circulation;
  @HiveField(6)
  final List<int> years;
  @HiveField(7)
  final List<String> facilities;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.currency,
    required this.nominal,
    required this.circulation,
    required this.years,
    required this.facilities,
  });

  // static Catalog createFromDto(CatalogDto dto) {
  //   return File(id: dto.id, fileName: dto.fileName ?? dto.content ?? "", contentType: dto.contentType ?? "", fileDownloadUrl: dto.fileDownloadUrl);
  // }
}
