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

class SomeEntity {
  const SomeEntity(this.firstField, this.secondField, this.payload, this.entities);

  final int firstField;
  final int secondField;
  final String payload;
  final List<SomeEntity> entities;
}

List<SomeEntity> generateEntities(int howMuch, {bool fixedString = true, bool cyclic = false}) {
  final List<SomeEntity> entities = [];
  for (int i = 0; i < howMuch; i++) {
    entities.add(SomeEntity(i, i * 2, ''.padLeft(fixedString ? 10 : i, 'A'), []));
  }
  if (cyclic) {
    for (int i = 0; i < howMuch; i++) {
      final SomeEntity entity = entities[i];
      if (i + 2 < howMuch) {
        final List<SomeEntity> nextEntities = entities.sublist(i + 1, i + 2);
        entity.entities.addAll(nextEntities);
      }
    }
  }
  return entities;
}

String generateBigString(int length) {
  final List<String> alphabet = '1234567890abcdefghijklmnopqrstuvwxyz'.split('');
  final List<String> response = [];
  for (int i = 0; i < length; i++) {
    final int index = i < alphabet.length ? i : (alphabet.length - 1) % i;
    final String symbol = alphabet[index];
    response.add(symbol);
  }
  return response.join('');
}

String prettyStringSize(int bytesSize) {
  if (bytesSize <= 1024) {
    return '$bytesSize bytes';
  } else if (bytesSize > 1024 && bytesSize <= 1024 * 1024) {
    return '${bytesSize / 1024} kb';
  }
  return '${bytesSize / 1024 / 1024} mb';
}
