import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomPaintExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomPaint(
          painter: BasicPainter(),
        ),
      ),
    );
  }
}

class BasicPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(10, 10);
    path.lineTo(100, 10);
    path.lineTo(100, 100);
    path.lineTo(10, 100);
    path.close();

    final paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xffff0000);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
