import 'dart:async';
import 'dart:isolate';

import 'package:examples/service/benchmark.dart';
import 'package:examples/service/utils.dart';

const bool maxIsolatesExample = false;
const int maximumIsolates = maxIsolatesExample ? 5000 : 2;
const int entitiesLimit = maxIsolatesExample ? 5 : 1000 * 100;
const Duration durationBetweenCreation = Duration(milliseconds: 2);
int isolateId = 0;

class ClassInIsolate {
  ClassInIsolate(this.id) {
    print('Class in isolate with id = $id was created');
    runPeriodic();
    if (id == 1) {
      fillEntities();
    }
  }
  final int id;

  final List<SomeEntity> entities = [];

  void runPeriodic() {
    Timer.periodic(const Duration(seconds: 30), (timer) {
      print('Isolate with id = $id still alive!');
    });
  }

  Future<void> fillEntities() async {
    bench.start('Time for init of $entitiesLimit SomeEntities');
    for (int i = 0; i < entitiesLimit; i++) {
      entities.add(SomeEntity(i, i * 2, ''.padLeft(i, 'A'), []));
      if (i % 1000 == 0) {
        print('Wait before creating next entities');
        await wait(1000);
      }
    }
    bench.end('Time for init of $entitiesLimit SomeEntities');
  }
}

void printInt(int isolateId) {
  ClassInIsolate(isolateId);
}

Future<void> runIsolate(int isolateId) async {
  await Isolate.spawn(printInt, isolateId, debugName: 'Isolate: $isolateId');
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
