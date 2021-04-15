import 'package:flutter/material.dart';

import 'widgets/custom_paint_example.dart';
import 'widgets/save_layer_example.dart';

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
      // home: AnimatedGradientExample(),
      // home: HourglassExample(),
      // home: DartUiWidgetsExample(),
    );
  }
}
