import 'package:flutter/material.dart';
import 'dart:math';

class CircularWaiter extends StatefulWidget {
  late final Color? color;

  CircularWaiter({this.color});

  @override
  State<CircularWaiter> createState() => _CircularWaiterState(color);
}

class _CircularWaiterState extends State<CircularWaiter>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<int> animation;
  late final Color? color;

  _CircularWaiterState(Color? color) {
    this.color = color;
  }

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        lowerBound: 0,
        upperBound: 2 * pi,
        duration: const Duration(seconds: 1),
        vsync: this);
    animation = Tween<int>(
      begin: 0,
      end: 360,
    ).animate(controller)
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat();
        }
        setState(() {});
      });
    controller.forward();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Transform.rotate(
      angle: controller.value,
      child: Container(
          width: 400,
          height: 400,
          child: CustomPaint(painter: Figure(radius: 20, color: color))),
    ));
  }
}

Paint createPaintForColor(Color? color) {
  return Paint()
    ..color = color != null ? color : Colors.blue
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;
}

class Figure extends CustomPainter {
  late final double radius;
  late final Color? color;

  Figure({required this.radius, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint arc = createPaintForColor(color);
    Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: radius);
    canvas.drawArc(rect, 0, sweepAngle(), false, arc);
    canvas.drawArc(rect, 0 + 2 / 3 * pi, sweepAngle(), false, arc);
    canvas.drawArc(rect, 0 + 4 / 3 * pi, sweepAngle(), false, arc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  double sweepAngle() => 0.8 * 2 / 3 * pi;
}
