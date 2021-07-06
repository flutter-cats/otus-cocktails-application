import 'dart:async';

void main() {
  final Completer<int> completer = Completer();
  int value = 0;
  Timer.periodic(const Duration(milliseconds: 20), (Timer timer) async {
    value++;
    if (value >= 100) {
      timer.cancel();
      completer.complete(value);
    }
  });
  completer.future.then((int value) => print('Completer result: $value'));
}
