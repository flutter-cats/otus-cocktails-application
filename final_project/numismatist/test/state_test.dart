import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:numismatist/core/const.dart';

@TestOn('vm')
import 'package:hive_flutter/hive_flutter.dart';
import 'package:numismatist/repository/models/catalog.dart';
import 'package:numismatist/repository/models/currency.dart';
import 'package:numismatist/repository/models/favorite.dart';
import 'package:numismatist/repository/models/item.dart';
import 'package:numismatist/repository/repository.dart';

void main() {
  late Repository repository;
  setUpAll(() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CurrencyAdapter());
    Hive.registerAdapter(CatalogAdapter());
    Hive.registerAdapter(FavoriteAdapter());
    Hive.registerAdapter(ItemAdapter());
    if (await Hive.boxExists(Const.catalogsBox)) await Hive.deleteBoxFromDisk(Const.catalogsBox);
    if (await Hive.boxExists(Const.itemsBox)) await Hive.deleteBoxFromDisk(Const.itemsBox);
    if (await Hive.boxExists(Const.favoriteBox)) await Hive.deleteBoxFromDisk(Const.favoriteBox);
    if (await Hive.boxExists(Const.settingsBox)) await Hive.deleteBoxFromDisk(Const.settingsBox);
    await Hive.openBox<Catalog>(Const.catalogsBox);
    await Hive.openBox<Item>(Const.itemsBox);
    await Hive.openBox<Favorite>(Const.favoriteBox);
    await Hive.openBox(Const.settingsBox);
    repository = Repository();
  });

  final addId = "1";
  final removeId = "2";
  // group('Favorites storage should', () {
  // test('Favorites storage should be empty in initial state', () {
  //   expect(repository.isEmpty, isTrue);
  // });

  // test('Favorites storage should return nothing in initial state', () {
  //   expect(repository.getAll().length, 0);
  // });

  // test('Favorites storage should be not empty after add', () {
  //   repository.add(CocktailDefinition(id: addId, categoryName: "test", drinkThumbUrl: "", isFavourite: true, name: "test"));

  //   expect(repository.isEmpty, isFalse);
  //   expect(repository.getAll().length, 1);

  //   repository.removeFromFavorites(addId);
  //   expect(repository.isEmpty, isTrue);
  //   expect(repository.getAll().length, 0);
  // });

  // test('Favorites storage should be not empty after add and remove', () {
  // favoritesStorage.add(CocktailDefinition(id: removeId, categoryName: "test", drinkThumbUrl: "", isFavourite: true, name: "test"));
  // favoritesStorage.removeFromFavorites(removeId);

  // expect(favoritesStorage.isEmpty, isTrue);
  // expect(favoritesStorage.getAll().length, 0);
  // });
  // });
}
