import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:examples/service/benchmark.dart';
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
    final Container<TransferableTypedData, int, void> typedMessage = message as Container<TransferableTypedData, int, void>;
    print('Time for transfer ${prettyStringSize(sizeOfString)} String: ${(DateTime.now().microsecondsSinceEpoch - typedMessage.second) / 1000}ms');
    final TransferableTypedData data = typedMessage.first;
    bench.start('Materialize TransferableTypedData');
    final ByteBuffer buffer = data.materialize();
    bench.end('Materialize TransferableTypedData');
    bench.start('Convert TransferableTypedData to bytes');
    final Uint8List bytes = buffer.asUint8List();
    bench.end('Convert TransferableTypedData to bytes');
    bench.start('Convert bytes to String');
    utf8.decode(bytes);
    bench.end('Convert bytes to String');
  });
  toMainIsolatePort.send(Container(first: receivePort.sendPort, second: null, third: null));
}

Future<void> runCase() async {
  final Container<Isolate, SendPort, Stream<dynamic>> isolateData = await createIsolate(data: null, creator: inIsolateFunction);
  final SendPort toIsolatePort = isolateData.second;
  bench.start('Convert string to bytes');
  final List<int> bytes = utf8.encode(bigString);
  bench.end('Convert string to bytes');
  bench.start('Convert bytes to TransferableTypedData');
  final TransferableTypedData data = TransferableTypedData.fromList([Uint8List.fromList(bytes)]);
  bench.end('Convert bytes to TransferableTypedData');
  toIsolatePort.send(Container(first: data, second: DateTime.now().microsecondsSinceEpoch, third: null));
  await wait(3 * 1000);
  exit(0);
}
