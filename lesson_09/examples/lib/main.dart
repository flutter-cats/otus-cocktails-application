import 'package:examples/gestures/buttons.dart';
import 'package:examples/gestures/gesture_detector_example.dart';
import 'package:examples/gestures/ink_widgets.dart';
import 'package:examples/gestures/listener_example.dart';
import 'package:examples/gestures/raw_gesture_detector_example.dart';
import 'package:examples/inputs/inputs.dart';
import 'package:flutter/material.dart';

import 'inputs/text_fields.dart';

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
      // home: ButtonsExample(),
      // home: InkWidgetsExample(),
      // home: GestureDetectorExample(),
      // home: RawGestureDetectorExample(),
      // home: ListenerExample(),
      // home: InputsExample(),
      home: TextFieldsExample(),
    );
  }
}
