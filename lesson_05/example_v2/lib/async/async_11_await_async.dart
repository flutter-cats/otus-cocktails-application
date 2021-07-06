import 'dart:async';

Future<void> main() async {
  print(1);
  final Future<int> future = Future<int>.delayed(const Duration(seconds: 1), () => 2);
  final int value = await Future.any([
    future,
    getDbValue(),
  ]);
  print(value); // 2
}

Future<int> getDbValue() async {
  return Future<int>.delayed(const Duration(seconds: 3), () => 3);
}
