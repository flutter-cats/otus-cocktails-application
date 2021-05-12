import 'package:lesson_17/benchmark.dart';
import 'package:lesson_17/main.dart';
import 'package:lesson_17/model/entity.dart';
import 'package:lesson_17/repository/entity_repository.dart';

class SharedPrefsRepository<T extends Entity> implements EntityRepository<T> {
  @override
  Future<void> init() async {
    bench.start('Init $runtimeType repo');
    // TODO(alphamikle): Continue there
    bench.end('Init $runtimeType repo');
  }

  @override
  Future<List<T>> readAll() async {
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
  }

  @override
  Future<T> readById(String id) async {
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
  }

  @override
  Future<T> readByKey(String key) async {
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
  }

  @override
  Future<List<T>> replaceAll(List<T> entities) async {
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
  }

  @override
  Future<T> save(T entity) async {
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
  }

  @override
  Future<T> saveByKey(String key, T entity) async {
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
  }

  @override
  Future<List<T>> saveMany(List<T> entities) async {
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
  }

  @override
  Future<int> saveIndex(int index) async {
    bench.start('SaveIndex $runtimeType repo');
    // TODO(alphamikle): Delete this return and continue there
    bench.end('SaveIndex $runtimeType repo');
    return index;
  }

  @override
  Future<int> readIndex() async {
    bench.start('ReadIndex $runtimeType repo');
    // TODO(alphamikle): Delete this return and continue there
    bench.end('ReadIndex $runtimeType repo');
    return INITIAL_INDEX;
  }
}
