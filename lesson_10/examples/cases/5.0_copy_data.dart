import 'dart:io';
import 'dart:isolate';

import 'package:examples/service/utils.dart';

const int entitiesLimit = 30 * 1000;
const bool cyclic = true;

void main() {
  runCase();
}

final List<SomeEntity> entities = generateEntities(entitiesLimit, cyclic: cyclic);

Future<void> inIsolateFunction(Container<SendPort, void, void> argument) async {
  final ReceivePort receivePort = ReceivePort();
  final SendPort toMainIsolatePort = argument.first;
  receivePort.listen((message) {
    final Container<List<SomeEntity>, int, void> typedMessage = message as Container<List<SomeEntity>, int, void>;
    final List<SomeEntity> entities = typedMessage.first;
    if (cyclic) {
      print('Hashcode after send of second and second in first: ${entities.first.entities.first.hashCode} == ${entities[1].hashCode}');
    } else {
      print('Hashcode after send ${entities.hashCode}');
    }
    print('Time for transfer ${entities.length} SomeEntities: ${(DateTime.now().microsecondsSinceEpoch - typedMessage.second) / 1000}ms');
  });
  toMainIsolatePort.send(Container(first: receivePort.sendPort, second: null, third: null));
}

Future<void> runCase() async {
  final Container<Isolate, SendPort, Stream<dynamic>> isolateData = await createIsolate(data: null, creator: inIsolateFunction);
  final SendPort toIsolatePort = isolateData.second;
  if (cyclic) {
    print('Hashcode before send of second and second in first: ${entities.first.entities.first.hashCode} == ${entities[1].hashCode}');
  } else {
    print('Hashcode before send ${entities.hashCode}');
  }
  toIsolatePort.send(Container(first: entities, second: DateTime.now().microsecondsSinceEpoch, third: null));
  await wait(3 * 1000);
  exit(0);
}
