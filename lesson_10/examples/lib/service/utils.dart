import 'dart:async';
import 'dart:isolate';

int fibonacci(int n) {
  return n <= 2 ? 1 : fibonacci(n - 2) + fibonacci(n - 1);
}

Future<void> wait([int ms = 1000]) async {
  await Future<void>.delayed(Duration(milliseconds: ms));
}

class Container<F, S, T> {
  const Container({required this.first, required this.second, required this.third});

  final F first;
  final S second;
  final T third;
}

typedef Creator<T, R> = R Function(Container<SendPort, T, void>);

Future<Container<Isolate, SendPort, Stream<dynamic>>> createIsolate<T, R>({required T data, required Creator<T, R> creator, String? debugName}) async {
  final Completer<Container<Isolate, SendPort, Stream<dynamic>>> completer = Completer();
  late Isolate isolate;
  final ReceivePort receivePort = ReceivePort();
  final Stream<dynamic> receiveStream = receivePort.asBroadcastStream();
  final StreamSubscription<dynamic> subscription = receiveStream.listen((dynamic event) {
    if (event is Container<SendPort, void, void>) {
      final Container<Isolate, SendPort, Stream<dynamic>> response = Container(first: isolate, second: event.first, third: receiveStream);
      completer.complete(response);
    }
  });
  final Container<SendPort, T, void> container = Container(first: receivePort.sendPort, second: data, third: null);
  isolate = await Isolate.spawn(creator, container, debugName: debugName);
  final Container<Isolate, SendPort, Stream<dynamic>> response = await completer.future;
  subscription.cancel();
  return response;
}
