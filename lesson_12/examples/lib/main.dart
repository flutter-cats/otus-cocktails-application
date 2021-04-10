import 'package:examples/widgets/bezier_curve_example.dart';
import 'package:flutter/material.dart';

import 'widgets/paint_example.dart';

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
      home: PaintExample(),
    );
  }
}
