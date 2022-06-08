import 'package:hive_flutter/hive_flutter.dart';
import 'package:numismatist/core/const.dart';
import 'package:numismatist/storage/models/catalog.dart';
import 'package:numismatist/storage/models/currency.dart';
import 'package:numismatist/storage/models/favorite.dart';
import 'package:numismatist/storage/models/item.dart';

class AppBuilder {
  static Future<void> setup() async {
    //Intl.defaultLocale = 'ru_RU';

    await Hive.initFlutter();
    Hive.registerAdapter(CurrencyAdapter());
    Hive.registerAdapter(CatalogAdapter());
    Hive.registerAdapter(FavoriteAdapter());
    Hive.registerAdapter(ItemAdapter());

    await Hive.openBox(Const.catalogsBox);
    await Hive.openBox(Const.itemsBox);
    await Hive.openBox(Const.favoriteBox);
    await Hive.openBox(Const.settingsBox);
  }
}
