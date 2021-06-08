import 'dart:io';

import 'package:hive/hive.dart';
import 'package:lesson_17/benchmark.dart';
import 'package:lesson_17/model/cocktail/cocktail.dart';
import 'package:lesson_17/model/cocktail/cocktail_category.dart';
import 'package:lesson_17/model/cocktail/cocktail_type.dart';
import 'package:lesson_17/model/cocktail/glass_type.dart';
import 'package:lesson_17/model/cocktail/ingredient_definition.dart';
import 'package:lesson_17/model/entity.dart';
import 'package:lesson_17/repository/entity_repository.dart';
import 'package:path_provider/path_provider.dart';

class HiveRepository<T extends Entity> implements EntityRepository<T> {
  late Box<T> _box;
  late Box<dynamic> _dynamicBox;

  @override
  Future<void> init() async {
    bench.start('Init $runtimeType repo');
    final Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CocktailAdapter());
      Hive.registerAdapter(CocktailCategoryAdapter());
      Hive.registerAdapter(CocktailTypeAdapter());
      Hive.registerAdapter(GlassTypeAdapter());
      Hive.registerAdapter(IngredientDefinitionAdapter());
    }
    _box = await Hive.openBox('${T.hashCode}');
    _dynamicBox = await Hive.openBox<dynamic>(INDEX_STORAGE);
    bench.end('Init $runtimeType repo');
  }

  @override
  Future<List<T>> readAll() async {
    return _box.values.toList();
  }

  @override
  Future<T?> readById(String id) async {
    return _box.get(id);
  }

  @override
  Future<T?> readByKey(String key) async {
    return readById(key);
  }

  @override
  Future<List<T>> replaceAll(List<T> entities) async {
    await _box.clear();
    entities.forEach(save);
    return entities;
  }

  @override
  Future<T> save(T entity) async {
    await _box.put(entity.id, entity);
    return entity;
  }

  @override
  Future<T> saveByKey(String key, T entity) async {
    await _box.put(key, entity);
    return entity;
  }

  @override
  Future<List<T>> saveMany(List<T> entities) async {
    await _box.addAll(entities);
    return entities;
  }

  @override
  Future<int> saveIndex(int index) async {
    bench.start('SaveIndex $runtimeType repo');
    await _dynamicBox.put(INDEX_STORAGE, index);
    bench.end('SaveIndex $runtimeType repo');
    return index;
  }

  @override
  Future<int> readIndex() async {
    bench.start('ReadIndex $runtimeType repo');
    final int index = (await _dynamicBox.get(INDEX_STORAGE) as int?) ?? 0;
    bench.end('ReadIndex $runtimeType repo');
    return index;
  }
}
