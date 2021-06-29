import 'dart:developer';
import 'dart:math';

import 'package:flutter/cupertino.dart';

final List<String> array = [];

class CircleClipper extends CustomClipper<Path> {
  CircleClipper({
    required this.rads,
    this.withComputing = true,
  });

  final double rads;
  final bool withComputing;

  void heavyComputing() {
    Timeline.startSync('heavyComputing');
    String result = '';
    for (int i = 0; i < 500; i++) {
      result += i.toString();
    }
    array.add(result);
    Timeline.finishSync();
  }

  Rect calculateRect(Offset center, Size size) {
    return Rect.fromCenter(center: center, width: size.width, height: size.height);
  }

  @override
  Path getClip(Size size) {
    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final angle = pi * 2 * (rads - 0.000001);
    final path = Path()
      ..moveTo(center.dx, center.dy)
      ..lineTo(center.dx, center.dy - radius)
      ..arcTo(calculateRect(center, size), -pi / 2, angle, true)
      ..lineTo(center.dx, center.dy)
      ..close();
    if (withComputing) {
      heavyComputing();
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
