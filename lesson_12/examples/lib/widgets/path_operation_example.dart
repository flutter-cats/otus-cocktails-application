import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PathOperationExample extends StatelessWidget {
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
            painter: const PathOperationPainter(),
          ),
        ),
      ),
    );
  }
}

class PathOperationPainter extends CustomPainter {
  const PathOperationPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final circle = Path()..addOval(Offset.zero & (size / 2));
    final square = Path()
      ..addRect(
        Offset(size.width / 4, size.height / 4) & (size / 2),
      );

    canvas.drawPath(circle, Paint()..color = Colors.cyan);
    canvas.drawPath(square, Paint()..color = Colors.deepOrange);

    final combinedPath = Path.combine(
      PathOperation.intersect,
      // PathOperation.difference,
      // PathOperation.reverseDifference,
      // PathOperation.union,
      // PathOperation.xor,
      circle,
      square,
    );
    // canvas.drawPath(combinedPath, Paint()..color = Colors.purpleAccent);
  }

  @override
  bool shouldRepaint(covariant PathOperationPainter oldDelegate) {
    return false;
  }
}
