void main() {
  final eventLoop = EventLoop();
  eventLoop.execute(() => print('onKeyPress event handler'));
  eventLoop.execute(() => print('onTimer operation'));
  eventLoop.execute(() => print('onHttpResponse operation'));
  eventLoop.loop();
}

class EventLoop {
  final List<Function> _queue = [];
  final List<Function> _queueMicrotasks = [];

  void execute(Function function) {
    _queue.add(function);
  }

  void loop() {
    while (_queueMicrotasks.isNotEmpty) {
      final currentAsyncOperation = _queueMicrotasks.removeLast();
      currentAsyncOperation.call();
    }
    while (_queue.isNotEmpty) {
      final currentAsyncOperation = _queue.removeLast();
      currentAsyncOperation.call();
    }
  }
}
