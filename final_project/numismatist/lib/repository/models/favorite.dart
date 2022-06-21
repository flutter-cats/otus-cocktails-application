import 'package:hive_flutter/hive_flutter.dart';

import 'package:numismatist/core/const.dart';

part 'favorite.g.dart';

@HiveType(typeId: HiveConst.favorite)
class Favorite {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int itemId;
  @HiveField(2)
  final int year;
  @HiveField(3)
  final String quality;
  Favorite({
    required this.id,
    required this.itemId,
    required this.year,
    required this.quality,
  });

  // static Catalog createFromDto(CatalogDto dto) {
  //   return File(id: dto.id, fileName: dto.fileName ?? dto.content ?? "", contentType: dto.contentType ?? "", fileDownloadUrl: dto.fileDownloadUrl);
  // }
}
