import 'package:hive_flutter/hive_flutter.dart';
import 'package:numismatist/core/const.dart';
import 'package:numismatist/models/catalog.dart';
import 'package:numismatist/models/favorite.dart';
import 'package:numismatist/models/item.dart';

class AppBuilder {
  static Future<void> setup() async {
    //Intl.defaultLocale = 'ru_RU';

    await Hive.initFlutter();
    Hive.registerAdapter(CatalogAdapter());
    Hive.registerAdapter(FavoriteAdapter());
    Hive.registerAdapter(ItemAdapter());

    await Hive.openBox(Const.catalogsBox);
    await Hive.openBox(Const.itemsBox);
  }
}
