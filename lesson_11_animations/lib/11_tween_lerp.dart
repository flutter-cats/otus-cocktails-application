import 'package:flutter/animation.dart';

void main() {
  final tween = Tween(begin: 0.0, end: 5.0);

  // uncomment
  ///
  /// final tween = IntTween(begin: 0, end: 5);
  ///

  final duration = Duration(seconds: 1);
  final timeBetweenFrames = Duration.millisecondsPerSecond / 60;

  for (var currentTime = 0.0;
      currentTime < duration.inMilliseconds;
      currentTime += timeBetweenFrames) {
    final value = tween.lerp(currentTime / duration.inMilliseconds);
    print('current time is $currentTime, tween is $value');
  }

  final finalValue = tween.lerp(1);
  print('tween is $finalValue');
}
