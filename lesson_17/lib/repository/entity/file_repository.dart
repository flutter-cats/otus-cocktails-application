import 'dart:convert';
import 'dart:io';

import 'package:lesson_17/benchmark.dart';
import 'package:lesson_17/model/entity.dart';
import 'package:lesson_17/repository/entity_repository.dart';
import 'package:path_provider/path_provider.dart';

abstract class FileRepository<T extends Entity> implements EntityRepository<T> {
  late File _file;

  T entityFabric(Map<String, dynamic> json);

  Future<Map<String, dynamic>> _readFile() async {
    final String fileJson = await _file.readAsString();
    if (fileJson.isEmpty) {
      return _getInitialContent();
    }
    return jsonDecode(fileJson) as Map<String, dynamic>;
  }

  Future<void> _writeToFile(Map<String, dynamic> json) async {
    await _file.writeAsString(jsonEncode(json));
  }

  Map<String, dynamic> _getInitialContent() {
    return <String, dynamic>{
      ITEMS_BY_ID_COLLECTION: <String, dynamic>{},
      ITEMS_BY_KEY_COLLECTION: <String, dynamic>{},
      INDEX_STORAGE: 0,
    };
  }

  @override
  Future<void> init() async {
    bench.start('Init $runtimeType repo');
    final Directory dir = await getApplicationDocumentsDirectory();
    _file = File('${dir.path}/file/${T.hashCode}.json');
    if (!(await _file.exists())) {
      await _file.create(recursive: true);
      await _writeToFile(_getInitialContent());
    }
    bench.end('Init $runtimeType repo');
  }

  @override
  Future<List<T>> readAll() async {
    final Map<String, dynamic> collections = await _readFile();
    final Map<String, dynamic> entitiesByIds = collections[ITEMS_BY_ID_COLLECTION] as Map<String, dynamic>;
    final Map<String, dynamic> entitiesByKeys = collections[ITEMS_BY_KEY_COLLECTION] as Map<String, dynamic>;
    final Iterable<dynamic> entities = <dynamic>[...entitiesByIds.values, ...entitiesByKeys.values];
    return entities.map((dynamic json) => entityFabric(json as Map<String, dynamic>)).toList();
  }

  @override
  Future<T?> readById(String id) async {
    final Map<String, dynamic> collections = await _readFile();
    final Map<String, dynamic> entitiesByIds = collections[ITEMS_BY_ID_COLLECTION] as Map<String, dynamic>;
    if (!entitiesByIds.containsKey(id)) {
      return null;
    }
    return entityFabric(entitiesByIds[id] as Map<String, dynamic>);
  }

  @override
  Future<T?> readByKey(String key) async {
    final Map<String, dynamic> collections = await _readFile();
    final Map<String, dynamic> entitiesByKeys = collections[ITEMS_BY_KEY_COLLECTION] as Map<String, dynamic>;
    if (!entitiesByKeys.containsKey(key)) {
      return null;
    }
    return entityFabric(entitiesByKeys[key] as Map<String, dynamic>);
  }

  @override
  Future<List<T>> replaceAll(List<T> entities) async {
    final Map<String, dynamic> collections = _getInitialContent();
    for (final T entity in entities) {
      collections[ITEMS_BY_ID_COLLECTION]![entity.id] = entity.toJson();
    }
    await _writeToFile(collections);
    return entities;
  }

  @override
  Future<T> save(T entity) async {
    final Map<String, dynamic> collections = await _readFile();
    collections[ITEMS_BY_ID_COLLECTION]![entity.id] = entity;
    await _writeToFile(collections);
    return entity;
  }

  @override
  Future<T> saveByKey(String key, T entity) async {
    final Map<String, dynamic> collections = await _readFile();
    collections[ITEMS_BY_KEY_COLLECTION]![key] = entity;
    await _writeToFile(collections);
    return entity;
  }

  @override
  Future<List<T>> saveMany(List<T> entities) async {
    final Map<String, dynamic> collections = await _readFile();
    for (final T entity in entities) {
      collections[ITEMS_BY_ID_COLLECTION]![entity.id] = entity.toJson();
    }
    await _writeToFile(collections);
    return entities;
  }

  @override
  Future<int> saveIndex(int index) async {
    bench.start('SaveIndex $runtimeType repo');
    final Map<String, dynamic> collections = await _readFile();
    collections[INDEX_STORAGE] = index;
    await _writeToFile(collections);
    bench.end('SaveIndex $runtimeType repo');
    return index;
  }

  @override
  Future<int> readIndex() async {
    bench.start('ReadIndex $runtimeType repo');
    final Map<String, dynamic> collections = await _readFile();
    bench.end('ReadIndex $runtimeType repo');
    return collections[INDEX_STORAGE] as int;
  }
}
