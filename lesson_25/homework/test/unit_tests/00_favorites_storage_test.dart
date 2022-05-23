@TestOn('vm')
import 'package:cocktail_app_tests/core/cocktail_db_service.dart';
import 'package:cocktail_app_tests/core/hive_helper.dart';
import 'package:cocktail_app_tests/core/models.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test/test.dart';

void main() {
  late CocktailsDBService favoritesStorage;
  setUpAll(() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CocktailDefinitionAdapter());
    if (await Hive.boxExists(HiveHelper.boxName)) await Hive.deleteBoxFromDisk(HiveHelper.boxName);
    await Hive.openBox(HiveHelper.boxName);
    favoritesStorage = CocktailsDBService();
  });

  final addId = "1";
  final removeId = "2";
  group('Favorites storage should', () {
    test('Favorites storage should be empty in initial state', () {
      expect(favoritesStorage.isEmpty, isTrue);
    });

    test('Favorites storage should return nothing in initial state', () {
      expect(favoritesStorage.getAll().length, 0);
    });

    test('Favorites storage should be not empty after add', () {
      favoritesStorage.add(CocktailDefinition(id: addId, categoryName: "test", drinkThumbUrl: "", isFavourite: true, name: "test"));

      expect(favoritesStorage.isEmpty, isFalse);
      expect(favoritesStorage.getAll().length, 1);

      favoritesStorage.removeFromFavorites(addId);
      expect(favoritesStorage.isEmpty, isTrue);
      expect(favoritesStorage.getAll().length, 0);
    });

    test('Favorites storage should be not empty after add and remove', () {
      favoritesStorage.add(CocktailDefinition(id: removeId, categoryName: "test", drinkThumbUrl: "", isFavourite: true, name: "test"));
      favoritesStorage.removeFromFavorites(removeId);

      expect(favoritesStorage.isEmpty, isTrue);
      expect(favoritesStorage.getAll().length, 0);
    });
  });
}
