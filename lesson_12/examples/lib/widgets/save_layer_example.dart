import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SaveLayerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            width: 200,
            height: 100,
            child: CustomPaint(
              painter: SaveLayerPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class SaveLayerPainter extends CustomPainter {
  final _shadowOffset = Offset(70, 30);
  final _shadowColor = Colors.black;
  final _shadowBlur = const MaskFilter.blur(BlurStyle.normal, 4);
  final _shadowOpacity = 1.0; //0.5

  SaveLayerPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(_shadowOffset.dx, _shadowOffset.dy);

    _paintShadowWithoutSaveLayer(canvas, size);
    // _paintShadowWithSaveLayer(canvas, size);

    canvas.restore();

    final pinkPaint = Paint()..color = Colors.pink;
    final greenPaint = Paint()..color = Colors.lightGreenAccent;
    _paintObjects(canvas, size, circlePaint: pinkPaint, rectPaint: greenPaint);
  }

  void _paintObjects(
    Canvas canvas,
    Size size, {
    required Paint rectPaint,
    required Paint circlePaint,
  }) {
    canvas.drawRect(Offset.zero & (size / 2), rectPaint);
    canvas.drawCircle(Offset.zero, size.shortestSide / 2, circlePaint);
  }

  void _paintShadowWithoutSaveLayer(Canvas canvas, Size size) {
    final shadowPaint = Paint()
      ..color = _shadowColor.withOpacity(_shadowOpacity)
      ..maskFilter = _shadowBlur;

    _paintObjects(
      canvas,
      size,
      circlePaint: shadowPaint,
      rectPaint: shadowPaint,
    );
  }

  void _paintShadowWithSaveLayer(Canvas canvas, Size size) {
    // final layerPaint = Paint()
    //   ..color = _shadowColor.withOpacity(_shadowOpacity);
    //
    // canvas.saveLayer(null, layerPaint);

    final shadowPaint = Paint()
      ..color = _shadowColor
      ..maskFilter = _shadowBlur;

    _paintObjects(
      canvas,
      size,
      circlePaint: shadowPaint,
      rectPaint: shadowPaint,
    );

    // canvas.restore();
  }

  @override
  bool shouldRepaint(covariant SaveLayerPainter oldDelegate) {
    return false;
  }
}
