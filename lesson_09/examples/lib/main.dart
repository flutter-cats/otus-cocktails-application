import 'package:examples/gestures/listener_example.dart';
import 'package:examples/gestures/raw_gesture_detector_example.dart';
import 'package:flutter/material.dart';

import 'gestures/buttons.dart';
import 'gestures/gesture_detector_example.dart';
import 'gestures/ink_widgets.dart';
import 'inputs/inputs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestures & Inputs examples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: InputsExample(),
    );
  }
}
