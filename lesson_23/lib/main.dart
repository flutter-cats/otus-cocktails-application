import 'package:flutter/material.dart';
import 'package:lesson_23/features_example.dart';

import 'simple_example.dart';

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
      home: FeaturesExample(),
    );
  }
}
