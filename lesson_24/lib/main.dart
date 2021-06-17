import 'package:flutter/material.dart';

import 'density_example.dart';
import 'embed_example.dart';
import 'focus_node_example.dart';
import 'interop_example.dart';
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
      // home: GestureDetectorExample(),
      // home: MouseRegionExample(),
      //   home: FocusNodeExample(),
      //todo raw listener
      // home: ShortcutsExample(),
      // home: InteropExample(),
      home: EmbedExample(),
    );
  }
}
