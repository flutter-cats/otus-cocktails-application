import 'dart:async';

void main() {
  ///
  /// Мы в главном изоляте
  /// создадим event loop
  ///

  final eventLoop = EventLoop();

  ///
  /// Получили список обработчиков событий, таймеров, и
  /// операций IO
  ///

  eventLoop.execute(() => print('onKeyPress event handler'));
  eventLoop.execute(() => print('onTimer operation'));
  eventLoop.execute(() => print('onHttpResponse operation'));

  eventLoop.scheduleMicrotask(() => print('I' 'm microtask !!!'));
  eventLoop.scheduleMicrotask(() => print('I' 'm microtask too!!!'));

  eventLoop.loop();

     scheduleMicrotask((){});
}

class EventLoop {
  List<Function> _queue = [];
  List<Function> _microtasks = [];

  void execute(Function function) {
    _queue.add(function);
  }

  void scheduleMicrotask(Function function) {
    _microtasks.add(function);
  }

  void loop() {
    while (_queue.isNotEmpty) {
      while (_microtasks.isNotEmpty) {
        final currentMicrotaskOperation = _microtasks.removeLast();
        currentMicrotaskOperation.call();
      }

      final currentAsyncOperation = _queue.removeLast();
      currentAsyncOperation.call();
    }
  }
}
