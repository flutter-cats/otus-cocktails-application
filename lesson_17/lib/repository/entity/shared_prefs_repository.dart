import 'dart:convert';

import 'package:lesson_17/benchmark.dart';
import 'package:lesson_17/model/entity.dart';
import 'package:lesson_17/repository/entity_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefsRepository<T extends Entity> implements EntityRepository<T> {
  late SharedPreferences _refs;

  T entityFabric(Map<String, dynamic> json);

  Map<String, dynamic> _readPrefs() {
    return jsonDecode(_refs.getString(ITEMS_BY_ID_COLLECTION) ?? '{}') as Map<String, dynamic>;
  }

  Future<void> _writePrefs(Map<String, dynamic> json) async {
    await _refs.setString(ITEMS_BY_ID_COLLECTION, jsonEncode(json));
  }

  @override
  Future<void> init() async {
    bench.start('Init $runtimeType repo');
    _refs = await SharedPreferences.getInstance();
    bench.end('Init $runtimeType repo');
  }

  @override
  Future<List<T>> readAll() async {
    final Map<String, dynamic> collection = _readPrefs();
    return collection.values.map((dynamic json) => entityFabric(json as Map<String, dynamic>)).toList();
  }

  @override
  Future<T?> readById(String id) async {
    final Map<String, dynamic> collection = _readPrefs();
    final Map<String, dynamic>? json = collection[id] as Map<String, dynamic>?;
    if (json == null) {
      return null;
    }
    return entityFabric(json);
  }

  @override
  Future<T?> readByKey(String key) async {
    return readById(key);
  }

  @override
  Future<List<T>> replaceAll(List<T> entities) async {
    await _refs.clear();
    await _refs.setInt(INDEX_STORAGE, 0);
    await saveMany(entities);
    return entities;
  }

  @override
  Future<T> save(T entity) async {
    await saveByKey(entity.id, entity);
    return entity;
  }

  @override
  Future<T> saveByKey(String key, T entity) async {
    final Map<String, dynamic> collection = _readPrefs();
    collection[key] = entity.toJson();
    await _writePrefs(collection);
    return entity;
  }

  @override
  Future<List<T>> saveMany(List<T> entities) async {
    final Map<String, dynamic> collection = _readPrefs();
    for (final T entity in entities) {
      collection[entity.id] = entity.toJson();
    }
    return entities;
  }

  @override
  Future<int> saveIndex(int index) async {
    bench.start('SaveIndex $runtimeType repo');
    await _refs.setInt(INDEX_STORAGE, index);
    bench.end('SaveIndex $runtimeType repo');
    return index;
  }

  @override
  Future<int> readIndex() async {
    bench.start('ReadIndex $runtimeType repo');
    final int index = _refs.getInt(INDEX_STORAGE) ?? 0;
    bench.end('ReadIndex $runtimeType repo');
    return index;
  }
}
