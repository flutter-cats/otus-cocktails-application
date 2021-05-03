import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

late Ticker ticker;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Center());

  tickerCreationDemo();
}

void tickerCreationDemo() {
  ticker = Ticker(_onTick);
  ticker.start();
}

Duration? previous;
void _onTick(Duration elapsed) {
  if (previous != null) {
    final frameDurationInMicroSecs = (elapsed - previous!).inMicroseconds;
    print('frameDurationInMicroSecs is $frameDurationInMicroSecs');
  }
  previous = elapsed;
}
