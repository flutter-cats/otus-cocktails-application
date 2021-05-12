import 'dart:convert';

import 'package:lesson_17/benchmark.dart';
import 'package:lesson_17/model/entity.dart';
import 'package:lesson_17/repository/entity_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefsRepository<T extends Entity> implements EntityRepository<T> {
  late SharedPreferences _refs;

  T entityFabric(Map<String, dynamic> json);

  @override
  Future<void> init() async {
    bench.start('Init $runtimeType repo');
    _refs = await SharedPreferences.getInstance();
    bench.end('Init $runtimeType repo');
  }

  @override
  Future<List<T>> readAll() async {
    final List<String> keys = _refs.getKeys().where((String key) => key != INDEX_STORAGE).toList();
    final List<T> entities = [];
    for (final String key in keys) {
      entities.add(entityFabric(jsonDecode(_refs.getString(key)!) as Map<String, dynamic>));
    }
    return entities;
  }

  @override
  Future<T?> readById(String id) async {
    final String? json = _refs.getString(id);
    if (json == null) {
      return null;
    }
    return entityFabric(jsonDecode(json) as Map<String, dynamic>);
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
    await _refs.setString(entity.id, jsonEncode(entity.toJson()));
    return entity;
  }

  @override
  Future<T> saveByKey(String key, T entity) async {
    await _refs.setString(key, jsonEncode(entity.toJson()));
    return entity;
  }

  @override
  Future<List<T>> saveMany(List<T> entities) async {
    // await Future.wait(entities.map(save));
    for (final T entity in entities) {
      await save(entity);
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
