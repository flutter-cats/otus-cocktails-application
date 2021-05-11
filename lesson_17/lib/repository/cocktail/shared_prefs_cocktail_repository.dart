import 'package:lesson_17/benchmark.dart';
import 'package:lesson_17/main.dart';
import 'package:lesson_17/model/cocktail/cocktail.dart';
import 'package:lesson_17/repository/entity_repository.dart';

class SharedPrefsCocktailRepository implements EntityRepository<Cocktail> {
  @override
  Future<void> init() async {
    bench.start('Init $runtimeType repo');
    // TODO(alphamikle): Continue there
    bench.end('Init $runtimeType repo');
  }

  @override
  Future<List<Cocktail>> readAll() async {
    bench.start('ReadAll $runtimeType repo');
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
    bench.end('ReadAll $runtimeType repo');
  }

  @override
  Future<Cocktail> readById(String id) async {
    bench.start('ReadById $runtimeType repo');
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
    bench.end('ReadById $runtimeType repo');
  }

  @override
  Future<Cocktail> readByKey(String key) async {
    bench.start('ReadByKey $runtimeType repo');
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
    bench.end('ReadByKey $runtimeType repo');
  }

  @override
  Future<List<Cocktail>> replaceAll(List<Cocktail> entities) async {
    bench.start('ReplaceAll $runtimeType repo');
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
    bench.end('ReplaceAll $runtimeType repo');
  }

  @override
  Future<Cocktail> save(Cocktail entity) async {
    bench.start('Save $runtimeType repo');
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
    bench.end('Save $runtimeType repo');
  }

  @override
  Future<Cocktail> saveByKey(String key, Cocktail entity) async {
    bench.start('SaveByKey $runtimeType repo');
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
    bench.end('SaveByKey $runtimeType repo');
  }

  @override
  Future<List<Cocktail>> saveMany(List<Cocktail> entities) async {
    bench.start('SaveMany $runtimeType repo');
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
    bench.end('SaveMany $runtimeType repo');
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
