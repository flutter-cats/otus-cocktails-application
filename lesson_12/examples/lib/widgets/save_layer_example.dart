import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SaveLayerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            width: 300,
            height: 200,
            child: CustomPaint(
              painter: const SaveLayerPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class SaveLayerPainter extends CustomPainter {
  const SaveLayerPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final shadowPaint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4);

    // canvas.saveLayer(Rect.largest, shadowPaint);

    // final opaquePaint = Paint()
    //   ..color = Colors.grey
    //   ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4);

    canvas.drawRect(Offset.zero & (size / 2), shadowPaint); // opaquePaint
    canvas.drawCircle(Offset.zero, size.shortestSide / 2, shadowPaint); // opaquePaint

    // canvas.restore();
  }

  @override
  bool shouldRepaint(covariant SaveLayerPainter oldDelegate) {
    return false;
  }
}
