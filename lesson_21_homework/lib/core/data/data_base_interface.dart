import 'dart:io';

import 'package:hive/hive.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IDataBase {
  void addFavouriteCocktail(CocktailDefinition definition);

  void removeFavouriteCocktail(CocktailDefinition definition);

  Future<Iterable<CocktailDefinition>> getFavouriteCocktails();
}

class SharedPrefs implements IDataBase {
  SharedPrefs();

  static const String _propertyName = "favourite_cocktails";

  @override
  void addFavouriteCocktail(CocktailDefinition definition) async {
    final prefs = await SharedPreferences.getInstance();
    var list = prefs.getStringList(_propertyName);
    if (list != null) {
      list.add(definition.toJson().toString());
      prefs.setStringList(_propertyName, list);
    }
  }

  @override
  Future<Iterable<CocktailDefinition>> getFavouriteCocktails() async {
    final prefs = await SharedPreferences.getInstance();
    var list = prefs.getStringList(_propertyName);
    // if (list != null && list.isNotEmpty) {
      // return Future.value(list.map((e) => CocktailDefinition.fromJson(e)));
    // } else {
      return Future.value(List.empty());
    // }
  }

  @override
  void removeFavouriteCocktail(CocktailDefinition definition) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(definition.id ?? '0');
  }
}

class DataBase implements IDataBase {
  static const String _DATABASE_NAME = 'FavouriteCocktailsDbName';

  Box? _dataBaseBox;

  DataBase() {
    _initDatabase();
  }

  void _initDatabase() async {
    var path = Directory.current.path;
    Hive
      ..init(path)
      ..registerAdapter(CocktailDefinitionAdapter());
    // _dataBaseBox = await Hive.openBox(_DATABASE_NAME);
  }

  @override
  void addFavouriteCocktail(CocktailDefinition definition) async {
    final box = await Hive.openBox(_DATABASE_NAME);
    box.put(definition.id, definition);
  }

  @override
  void removeFavouriteCocktail(CocktailDefinition definition) async {
    final box = await Hive.openBox(_DATABASE_NAME);
    box.delete(definition.id);
  }

  @override
  Future<Iterable<CocktailDefinition>> getFavouriteCocktails() async {
    var list = <CocktailDefinition>[];
    final box = await Hive.openBox(_DATABASE_NAME);
    final l = box.length;
    for (int i = 0; i < l; i++) {
      list.add(_dataBaseBox?.getAt(i));
    }
    return list;
  }
}

class DataBaseProvider {
  IDataBase provideDataBase() {
    return SharedPrefs();
  }
}
