import 'dart:async';

Future<void> main() async {
  print('Sync');
  Timer(Duration.zero, () => print('Async.timer'));
  Future<void>.delayed(const Duration(microseconds: 1500), () => print('Async.delayed non zero'));
  Future<void>.delayed(Duration.zero, () => print('Async.delayed'));
  Future<void>.microtask(() => print('Async:microtask'));
  Future.sync(() => print('Async.sync'));
}
