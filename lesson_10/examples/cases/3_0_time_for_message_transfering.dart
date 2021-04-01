import 'dart:isolate';

import 'package:examples/service/utils.dart';

void main() {
  runIsolate();
}

Future<void> inIsolateFunction(Container<SendPort, DateTime, void> data) async {
  final ReceivePort receivePort = ReceivePort();
  final SendPort fromMainIsolate = data.first;
  final DateTime timeOfCreation = data.second;
  fromMainIsolate.send(receivePort.sendPort);
  receivePort.listen((message) {
    print('Message from main isolate: $message');
  });
}

Future<void> runIsolate() async {
  final Container<Isolate, SendPort, Stream<dynamic>> data = await createIsolate(data: DateTime.now(), creator: inIsolateFunction);
  final Stream fromAnotherIsolateStream = data.third;
  final SendPort toAnotherIsolatePort = data.second;
  fromAnotherIsolateStream.listen((event) {
    print('Message from another isolate: $event');
  });
  toAnotherIsolatePort.send(null);
  await wait(60 * 1000);
}
