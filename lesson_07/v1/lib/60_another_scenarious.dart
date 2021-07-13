import 'dart:async';

import 'package:async/async.dart';

Future<void> main() async {
  final operations = Iterable.generate(10, (i) => AsyncOperation(i)).toList();

  ///
  /// Генератор для обработки списка асинхронных операций
  /// и принятия решения о том, нужно запустить операцию или нет, как обработать ее результат
  /// и прочее
  ///
  Stream<AsyncOperation> getOperationsStream() async* {
    while (operations.isNotEmpty) {
      final operation = operations.removeAt(0);
      operation.run();
      yield operation;
    }
  }

  getOperationsStream().listen((event) {});
}

///
/// Наша асинхронная операция (Unit of Work)
///
class AsyncOperation {
  final int id;

  AsyncOperation(this.id);

  void run() => print(this);

  @override
  String toString() => 'AsyncOperation {id: $id}';
}
