import 'dart:math';

import 'package:flutter/material.dart';

class AdaptiveProgressIndicator extends StatefulWidget {
  final Color color;
  final Color backgroundColor;

  const AdaptiveProgressIndicator({
    Key? key,
    this.color = Colors.white,
    this.backgroundColor = Colors.grey,
  }) : super(key: key);

  @override
  _AdaptiveProgressIndicatorState createState() =>
      _AdaptiveProgressIndicatorState();
}

class _AdaptiveProgressIndicatorState extends State<AdaptiveProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2500),
  )..repeat();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          child: CustomPaint(
            child: child,
            painter: ProgressIndicatorPainter(
              rotation: _controller.value,
              color: widget.color,
              backgroundColor: widget.backgroundColor,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ProgressIndicatorPainter extends CustomPainter {
  final double rotation;
  final Color color;
  final Color backgroundColor;

  ProgressIndicatorPainter(
      {required this.rotation,
      required this.color,
      required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(center: center, width: 50, height: 50);
    final radius = rect.width / 2;
    var startAngle = (rotation * 4 * pi);
    var sweepAngle = 300 * (2 * pi / 720);

    if (rotation <= 0.5) {
      startAngle = rotation * pi * 4;
      sweepAngle = 10 * pi / 180 + rotation * 400 * (pi / 180);
    }

    if (rotation > 0.5) {
      startAngle = 2 * pi + (rotation - 0.5) * pi * 2 * 4;
      sweepAngle = 0.5 * 400 * (2 * pi / 360) -
          ((rotation - 0.5) * 400 * (pi / 180) - 10 * pi / 180);
    }

    final paintCircle = Paint()
      ..color = this.backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final paintArc = Paint()
      ..color = this.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas
    ..drawCircle(center, radius, paintCircle)
    ..drawArc(rect, startAngle, sweepAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
