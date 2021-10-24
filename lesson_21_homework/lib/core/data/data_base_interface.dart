import 'dart:io';

import 'package:hive/hive.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

abstract class IDataBase {
  void addFavouriteCocktail(CocktailDefinition definition);

  void removeFavouriteCocktail(CocktailDefinition definition);

  Future<Iterable<CocktailDefinition>> getFavouriteCocktails();
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
    return DataBase();
  }
}
