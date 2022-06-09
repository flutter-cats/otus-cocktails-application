import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:numismatist/core/const.dart';
import 'package:numismatist/repository/models/catalog.dart';
import 'package:numismatist/repository/models/currency.dart';
import 'package:numismatist/repository/models/favorite.dart';
import 'package:numismatist/repository/models/item.dart';

class AppBuilder {
  static Future<void> setup() async {
    //Intl.defaultLocale = 'ru_RU';

    await Hive.initFlutter();
    Hive.registerAdapter(CurrencyAdapter());
    Hive.registerAdapter(CatalogAdapter());
    Hive.registerAdapter(FavoriteAdapter());
    Hive.registerAdapter(ItemAdapter());

    await Hive.openBox<Catalog>(Const.catalogsBox);
    await Hive.openBox<Item>(Const.itemsBox);
    await Hive.openBox<Favorite>(Const.favoriteBox);
    await Hive.openBox(Const.settingsBox);
  }
}
