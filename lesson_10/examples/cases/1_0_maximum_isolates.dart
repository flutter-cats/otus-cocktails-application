import 'dart:async';
import 'dart:isolate';

import 'package:examples/service/benchmark.dart';
import 'package:examples/service/utils.dart';

const int maximumIsolates = 2;
const int entitiesLimit = 1000 * 100;
const bool useFib = false;
const Duration durationBetweenCreation = Duration(milliseconds: 2);
int isolateId = 0;

class SomeEntity {
  const SomeEntity(this.firstField, this.secondField, this.payload);

  final int firstField;
  final int secondField;
  final String payload;
}

class ClassInIsolate {
  ClassInIsolate(this.id) : counter = id {
    print('Class in isolate with id = $id was created');
    runPeriodic();
    if (id == 1) {
      fillEntities();
    }
  }
  final int id;
  int counter;

  final List<SomeEntity> entities = [];

  void runPeriodic() {
    final int fib = useFib ? fibonacci(id) : 1;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      counter++;
      if (counter % (10 + id) == 0) {
        print('Isolate with id = $id still alive! This isolate fibonacci number is $fib. Entities count is ${entities.length}');
      }
    });
  }

  void fillEntities() {
    bench.start('Time for init of $entitiesLimit SomeEntities');
    for (int i = 0; i < entitiesLimit; i++) {
      entities.add(SomeEntity(i, i * 2, ''.padLeft(i, 'A')));
    }
    bench.end('Time for init of $entitiesLimit SomeEntities');
  }
}

void printInt(int isolateId) {
  ClassInIsolate(isolateId);
}

Future<void> runIsolate(int isolateId) async {
  final Isolate isolate = await Isolate.spawn(printInt, isolateId, debugName: 'Isolate: $isolateId');
  isolateId++;
}

Future<void> runIsolates() async {
  for (int id = 0; id < maximumIsolates; id++) {
    runIsolate(id);
    await Future<void>.delayed(durationBetweenCreation);
  }
  Timer.periodic(const Duration(seconds: 1), (timer) {
    print('Main isolate still alive');
  });
}

void main() {
  runIsolates();
}
