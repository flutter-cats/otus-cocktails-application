import 'package:flutter/material.dart';

import 'widgets/path_operation_example.dart';
import 'widgets/transform_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skia examples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // home:CustomPaintExample(),
      // home: BezierCurveExample(),
      // home: PaintExample(),
      // home: ClipPathExample(),
      // home: PathOperationExample(),
      home: TransformExample(),
    );
  }
}
