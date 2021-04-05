import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:examples/service/utils.dart';

const int sizeOfString = 400 * 1024 * 1024;

void main() {
  runCase();
}

final String bigString = generateBigString(sizeOfString);

Future<void> inIsolateFunction(Container<SendPort, void, void> argument) async {
  final ReceivePort receivePort = ReceivePort();
  final SendPort toMainIsolatePort = argument.first;
  receivePort.listen((message) {
    final Container<String, int, void> typedMessage = message as Container<String, int, void>;
    final String bigString = typedMessage.first;
    print('Time for transfer ${prettyStringSize(bigString.length)} String: ${(DateTime.now().microsecondsSinceEpoch - typedMessage.second) / 1000}ms');
  });
  toMainIsolatePort.send(Container(first: receivePort.sendPort, second: null, third: null));
}

Future<void> runCase() async {
  final Container<Isolate, SendPort, Stream<dynamic>> isolateData = await createIsolate(data: null, creator: inIsolateFunction);
  final SendPort toIsolatePort = isolateData.second;
  final int stringSize = utf8.encode(bigString).length;
  final String prettySize = prettyStringSize(stringSize);

  print('Big string size is $prettySize');
  toIsolatePort.send(Container(first: bigString, second: DateTime.now().microsecondsSinceEpoch, third: null));
  await wait(1000);
  toIsolatePort.send(Container(first: bigString, second: DateTime.now().microsecondsSinceEpoch, third: null));
  await wait(1000);
  toIsolatePort.send(Container(first: bigString, second: DateTime.now().microsecondsSinceEpoch, third: null));
  await wait(3 * 1000);
  exit(0);
}
