import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClipPathExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: const ClipPathPainter(),
          ),
        ),
      ),
    );
  }
}

class ClipPathPainter extends CustomPainter {
  const ClipPathPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.sweep(
        Offset(size.width / 2, size.height / 2),
        [Colors.red, Colors.yellow, Colors.green, Colors.blue, Colors.red],
        [0, 0.3, 0.5, 0.7, 1],
      );

    final triangle = Path()
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    // canvas.clipPath(triangle);

    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant ClipPathPainter oldDelegate) {
    return false;
  }
}
