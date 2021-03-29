import 'package:examples/inputs/form_example.dart';
import 'package:flutter/material.dart';

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
      // home: TextFieldsExample(),
      // home: TextFields2Example(),
      home: FormExample(),
    );
  }
}
