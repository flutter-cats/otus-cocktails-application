import 'dart:math';

import 'package:flutter/material.dart';

class CircularWaiter extends StatefulWidget {
  const CircularWaiter({Key? key}) : super(key: key);

  @override
  State<CircularWaiter> createState() => _CircularWaiterState();
}

class _CircularWaiterState extends State<CircularWaiter>
with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
    );
    animation = Tween<double>(
      begin: 0, end: 100
    ).animate(controller)
    ..addListener(() {
      setState(() {});
    });
    controller.repeat();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircularWaiterPainter(
        value: controller.value
      ),
    );
  }
}

class CircularWaiterPainter extends CustomPainter{
  late Color? color;
  late double value;

  CircularWaiterPainter({required this.value, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
    ..color = this.color != null ? color! : Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - (16 / 2);
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi,
        value,
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}