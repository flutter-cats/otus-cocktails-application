import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomCircularProgressIndicator extends StatefulWidget {
  const CustomCircularProgressIndicator({
    Key? key,
    this.startAngle = -90,
    this.endAngle = 360,
    this.width = 4.0,
    this.size = 42,
    this.duration = 2000,
  }) : super(key: key);

  final int startAngle;
  final int endAngle;
  final double width;
  final double size;
  final int duration;

  @override
  State<CustomCircularProgressIndicator> createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    )..repeat();

    // _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, Widget? childWidget) => CustomPaint(
          size: Size(widget.size, widget.size),
          painter: CircularProgressIndicatorPainter(
            startAngle: widget.startAngle,
            width: widget.width,
            sweepAngle: (widget.endAngle * _animationController.value).round(),
          ),
        ),
      ),
    );
  }
}

class CircularProgressIndicatorPainter extends CustomPainter {
  const CircularProgressIndicatorPainter({
    required this.width,
    required this.startAngle,
    required this.sweepAngle,
  }) : super();

  final double width;
  final int startAngle;
  final int sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    final startAngleRad = startAngle * (math.pi / 180.0);
    final sweepAngleRad = sweepAngle * (math.pi / 180.0);
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - (width / 2);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngleRad,
      sweepAngleRad,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressIndicatorPainter oldDelegate) =>
      oldDelegate.sweepAngle != sweepAngle;
}
