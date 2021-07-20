import 'package:examples/inputs/form_example.dart';
import 'package:flutter/material.dart';

import 'gestures/buttons_example.dart';
import 'gestures/gesture_detector_example.dart';
import 'gestures/ignore_pointer_example.dart';
import 'gestures/ink_widgets_example.dart';
import 'gestures/listener_example.dart';
import 'gestures/raw_gesture_detector_example.dart';
import 'inputs/custom_controller_example.dart';
import 'inputs/inputs_example.dart';
import 'inputs/text_fields2_example.dart';
import 'inputs/text_fields_example.dart';

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
      home: ButtonsExample(),
      // home: InkWidgetsExample(),
      // home: GestureDetectorExample(),
      // home: RawGestureDetectorExample(),
      // home: ListenerExample(),
      // home: IgnorePointerExample(),
      // home: InputsExample(),
      // home: TextFieldsExample(),
      // home: TextFields2Example(),
      // home: CustomControllerExample(),
      // home: FormExample(),
    );
  }
}
