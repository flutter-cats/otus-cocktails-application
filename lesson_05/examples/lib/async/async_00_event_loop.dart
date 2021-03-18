


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

  eventLoop.loop();
}

class EventLoop {
  List<Function> _queue = [];

  void execute(Function function) {
    _queue.add(function);
  }

  void loop() {
    while (_queue.isNotEmpty) {
      final currentAsyncOperation = _queue.removeLast();
      currentAsyncOperation.call();
    }
  }
}
