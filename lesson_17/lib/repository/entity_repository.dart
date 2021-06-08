import 'package:lesson_17/model/entity.dart';

const String ITEMS_BY_ID_COLLECTION = 'itemsByIds';
const String ITEMS_BY_KEY_COLLECTION = 'itemsByKey';
const String INDEX_STORAGE = 'indexStorage';

abstract class EntityRepository<T extends Entity> {
  Future<void> init();
  Future<T> save(T entity);
  Future<T> saveByKey(String key, T entity);
  Future<List<T>> saveMany(List<T> entities);
  Future<List<T>> replaceAll(List<T> entities);
  Future<T?> readByKey(String key);
  Future<T?> readById(String id);
  Future<List<T>> readAll();
  Future<int> saveIndex(int index);
  Future<int> readIndex();
}
