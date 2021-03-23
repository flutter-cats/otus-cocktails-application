import 'dart:async';
import 'dart:io';

void main() {
  final http = MyOwnHttpImplementor();
  http.get(Uri.parse('http://ya.ru')).then((value) {
    print(value);
  }).catchError((error) {
    print(error);
  });
}

class MyOwnHttpImplementor {
  Future<String> get(Uri uri) {
    final completer = Completer<String>();

    ///
    /// Здесь у меня много логики, настройки хедеров, другие асинхронные операции
    /// такие как логирование, профилирование, кеширование, и прочие
    ///
    /// await log();
    /// await storeResultInCache();
    /// await startTimer, endTimer(); etc.
    ///

    // completer.complete('successful operation');

    completer.completeError(HttpException('Uri is not accessible'));

    return completer.future;
  }
}

// ///
// /// Другой сценарий использования completer
// ///
class MyOwnDatabase {
  ///
  /// Сохраним список сущностей в базе данных
  ///
  Future<bool> store<T>(Iterable<T> batch) {
    final completer = Completer<bool>();

    ///
    /// Здесь у меня много логики, настройки хедеров, другие асинхронные операции
    /// такие как логирование, профилирование, кеширование, и прочие
    ///
    /// await log();
    /// await storeResultInCache();
    /// await startTimer, endTimer(); etc.
    ///

    for (T entity in batch) {
      _storeOneEntity(entity);
    }

    completer.complete(true);
    completer.complete(false);

    // completer.completeError(HttpException('Uri is not accessible'));

    return completer.future;
  }

  Future<bool> _storeOneEntity<T>(T entity) => throw Exception();
}
