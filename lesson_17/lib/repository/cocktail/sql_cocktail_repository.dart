import 'package:lesson_17/benchmark.dart';
import 'package:lesson_17/main.dart';
import 'package:lesson_17/model/cocktail/cocktail.dart';
import 'package:lesson_17/repository/entity_repository.dart';

class SqlCocktailRepository implements EntityRepository<Cocktail> {
  @override
  Future<void> init() async {
    bench.start('Init $runtimeType repo');
    // TODO(alphamikle): Continue there
    bench.end('Init $runtimeType repo');
  }

  @override
  Future<List<Cocktail>> readAll() async {
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
  }

  @override
  Future<Cocktail> readById(String id) async {
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
  }

  @override
  Future<Cocktail> readByKey(String key) async {
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
  }

  @override
  Future<List<Cocktail>> replaceAll(List<Cocktail> entities) async {
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
  }

  @override
  Future<Cocktail> save(Cocktail entity) async {
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
  }

  @override
  Future<Cocktail> saveByKey(String key, Cocktail entity) async {
    // TODO(alphamikle): Delete error and continue there
    throw UnimplementedError();
  }

  @override
  Future<List<Cocktail>> saveMany(List<Cocktail> entities) async {
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
