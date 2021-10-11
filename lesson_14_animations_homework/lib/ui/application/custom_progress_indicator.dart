import 'dart:math';

import 'package:flutter/material.dart';

class CustomProgressPainter extends CustomPainter {
  final Color color;
  final double rotation;

  CustomProgressPainter({required this.rotation, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) {
      return;
    }

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    late final startAngle;
    late final sweepAngle;
    if (rotation < 0.5) {
      startAngle = -1.5708;
      sweepAngle = 4 * pi * rotation;
    } else {
      startAngle = -1.5708 + 4 * pi * (rotation - 0.5);
      sweepAngle = 2 * pi - 4 * pi * (rotation - 0.5);
    }
    canvas.drawArc(
        Offset(0, 0) & Size(48, 48), startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ProgressLoader extends StatefulWidget {
  final Color color;

  const ProgressLoader({Key? key, this.color: Colors.white}) : super(key: key);

  @override
  _ProgressLoaderState createState() => _ProgressLoaderState();
}

class _ProgressLoaderState extends State<ProgressLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (_, Widget? childWidget) {
          return Container(
            width: 48,
            height: 48,
            child: CustomPaint(
              child: childWidget,
              painter: CustomProgressPainter(
                rotation: _controller.value,
                color: widget.color,
              ),
            ),
          );
        });
  }
}
