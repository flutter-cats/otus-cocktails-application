import 'dart:io';
import 'dart:isolate';

import 'package:examples/service/utils.dart';

void main() {
  runIsolate();
}

Future<void> inIsolateFunction(Container<SendPort, void, void> argument) async {
  final ReceivePort receivePort = ReceivePort();
  final SendPort toMainIsolatePort = argument.first;
  receivePort.listen((message) {
    final int microsFromMainIsolate = message as int;
    print('Time for message transfer ${(DateTime.now().microsecondsSinceEpoch - microsFromMainIsolate) / 1000}ms');
  });
  toMainIsolatePort.send(Container(first: receivePort.sendPort, second: null, third: null));
}

Future<void> runIsolate() async {
  final Container<Isolate, SendPort, Stream<dynamic>> isolateData = await createIsolate(data: null, creator: inIsolateFunction);
  final SendPort toIsolatePort = isolateData.second;
  toIsolatePort.send(DateTime.now().microsecondsSinceEpoch);
  await wait(1 * 1000);
  exit(0);
}
