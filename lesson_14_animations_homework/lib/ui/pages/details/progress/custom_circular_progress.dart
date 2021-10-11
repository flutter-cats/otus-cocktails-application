import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CocktailsCustomProgressViewWrapper extends StatelessWidget {
  final COUNTDOWN = 10;
  final color = Colors.pink;
  final radius = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      child: CircularProgressWithCirclesGoingInCircles(
          count: COUNTDOWN, color: color, radius: radius),
    );
  }
}

class CircularProgressWithCirclesGoingInCircles extends StatefulWidget {
  final int count;
  final double radius;
  final Color color;

  CircularProgressWithCirclesGoingInCircles(
      {required this.count, required this.radius, required this.color});

  @override
  State<StatefulWidget> createState() {
    return _CircularProgressState(count, radius, color);
  }
}

class _CircularProgressState extends State with SingleTickerProviderStateMixin {
  final double _alignRadius = 0.5;
  final int count;
  final double radius;
  final Color color;
  late AnimationController controller;

  _CircularProgressState(this.count, this.radius, this.color);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Stack(
        children: [
          for (var position in alignments.asMap().keys)
            Align(
              alignment: alignments[position],
              child: Circle(
                radius: radius,
                color: color.withOpacity(1 -
                    remainder(controller.value - position.toDouble() / count)),
              ),
            )
        ],
      ),
    );
  }

  double remainder(double opacity) {
    return opacity - opacity.floor();
  }

  List<Alignment> alignments = <Alignment>[];

  @override
  void initState() {
    super.initState();
    alignments.addAll(List.generate(
        count,
        (index) => Alignment(cos(2 * pi * (index) / count) * _alignRadius,
            sin(2 * pi * (index) / count) * _alignRadius)));
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller
      ..forward()
      ..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Circle extends StatelessWidget {
  final double radius;
  final Color color;

  Circle({required this.radius, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
