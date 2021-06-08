import 'package:examples/widgets/container_example.dart';
import 'package:flutter/material.dart';

import 'widgets/animated_gradient_example.dart';
import 'widgets/blend_mode_example.dart';
import 'widgets/custom_paint_example.dart';
import 'widgets/dart_ui_widgets_example.dart';
import 'widgets/hourglass_example.dart';

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
      home: CustomPaintExample(),
      // home: BezierCurveExample(),
      // home: PaintExample(),
      // home: ClipPathExample(),
      // home: PathOperationExample(),
      // home: TransformExample(),
      // home: SaveLayerExample(),
      // home: BlendModeExample(),
      // home: ContainerExample(),
      // home: AnimatedGradientExample(),
      // home: HourglassExample(),
      // home: DartUiWidgetsExample(),
    );
  }
}
