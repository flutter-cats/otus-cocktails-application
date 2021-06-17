import 'package:flutter/material.dart';

import 'density_example.dart';
import 'embed_example.dart';
import 'focus_node_example.dart';
import 'gesture_detector_example.dart';
import 'interop_example.dart';
import 'raw_keyboard_listener_example.dart';
import 'shortcuts_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SimpleExample(),
      // home: FeaturesExample(),
      home: GestureDetectorExample(),
      // home: MouseRegionExample(),
      //   home: FocusNodeExample(),
      // home: RawKeyboardListenerExample(),
      // home: ShortcutsExample(),
      // home: InteropExample(),
      // home: EmbedExample(),
    );
  }
}
