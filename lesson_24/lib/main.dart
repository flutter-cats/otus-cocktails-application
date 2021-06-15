import 'package:flutter/material.dart';

import 'density_example.dart';
import 'focus_node_example.dart';
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
      // home: MouseRegionExample(),
      // home: GestureDetectorExample(),
      // home: DensityExample(),todo
      //   home: FocusNodeExample(),
      home: ShortcutsExample(),
    );
  }
}
