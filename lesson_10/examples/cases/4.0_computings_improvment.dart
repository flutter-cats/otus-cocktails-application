import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';

import 'package:examples/service/benchmark.dart';
import 'package:examples/service/utils.dart';

final List<int> numbersForCompute = [];
int sum = 0;
const bool o2 = true;
const int numberOfNumbers = 10 * 1000;
const int cores = 4;
final Completer<int> resultsCompleter = Completer();

int heavyOperation(List<int> items, String id) {
  bench.start('--> Heavy operation in $id');
  int result = items.length;
  int sum = 0;

  for (int i = 0; i < items.length; i++) {
    /// This was made specially for synthetic difficult of operation
    if (o2) {
      for (int k = 0; k < items.length; k++) {
        final int item = items[i] + items[k];
        sum += item;
        result = ((sqrt(sum) * (sum / 2) + i) * 25).toInt();
      }
    } else {
      final int item = items[i] + items[i];
      sum += item;
      result = ((sqrt(sum) * (sum / 2) + i) * 25).toInt();
    }
  }
  bench.end('--> Heavy operation in $id');
  return result;
}

void computer(Container<SendPort, String, void> argument) {
  final ReceivePort receivePort = ReceivePort();
  final SendPort sendPort = argument.first;

  sendPort.send(Container<SendPort, void, void>(first: receivePort.sendPort, second: null, third: null));

  receivePort.listen((dynamic data) {
    final List<int> chunks = data as List<int>;
    final int result = heavyOperation(chunks, argument.second);
    sendPort.send(result);
  });
}

void fillNumbers() {
  for (int i = 0; i < numberOfNumbers; i++) {
    numbersForCompute.add(1);
  }
}

Future<void> main() async {
  bench.start('Filling');
  fillNumbers();
  bench.end('Filling');

  bench.start('Creating isolates');

  /// Creating for one isolate per one core of CPU
  final List<Container<Isolate, SendPort, Stream>> isolatesData = await Future.wait([
    for (int i = 0; i < cores; i++) createIsolate(data: 'Isolate: $i', creator: computer, debugName: 'Isolate: $i'),
  ]);
  bench.end('Creating isolates');

  final int itemsPerChunk = numbersForCompute.length ~/ cores;
  int currentIndex = 0;
  int lastChunkIndex = 0;

  print('''
-----------------------------------------------------------------
Starting computers in isolates
Number of cores / isolates: $cores
Number of items for compute: ${numbersForCompute.length}
Number of items for one isolate: $itemsPerChunk
-----------------------------------------------------------------
''');

  heavyOperation(numbersForCompute, 'Main isolate');

  bench.start('--> Computing in $cores isolates');
  for (final Container<Isolate, SendPort, Stream> isolateData in isolatesData) {
    final SendPort toIsolatePort = isolateData.second;
    final Stream<dynamic> fromIsolateStream = isolateData.third;
    final int startMiscos = DateTime.now().microsecondsSinceEpoch;

    fromIsolateStream.listen((dynamic event) {
      /// Handle answer from isolate
      final int result = event as int;
      sum += result;
      final int endMicros = DateTime.now().microsecondsSinceEpoch;
      final int timeForOperation = endMicros - startMiscos;
      print('Time for operation of ${isolateData.first.debugName}: ${timeForOperation / 1000}ms');
      currentIndex++;
      if (currentIndex == cores) {
        resultsCompleter.complete(sum);
      }
    });

    final List<int> currentChunk = numbersForCompute.sublist(lastChunkIndex, min(itemsPerChunk + lastChunkIndex, numbersForCompute.length));
    lastChunkIndex += itemsPerChunk;
    toIsolatePort.send(currentChunk);
  }
  await resultsCompleter.future;
  bench.end('--> Computing in $cores isolates');

  exit(0);
}
