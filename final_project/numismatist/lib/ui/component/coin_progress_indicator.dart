import 'dart:math';

import 'package:flutter/material.dart';

// анимация процесса загрузки
class CoinProgressIndicator extends StatefulWidget {
  final Color color;
  final double size;
  final double width;
  const CoinProgressIndicator({Key? key, this.color = Colors.white, this.size = 100, this.width = 10}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CoinProgressIndicatorState();
}

class _CoinProgressIndicatorState extends State<CoinProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: _controller,
      builder: (_, Widget? childWidget) => SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              child: childWidget,
              painter: CircularProgressIndicatorPainter(
                value: _controller.value,
                color: widget.color,
                size: widget.size,
                width: widget.width,
              ),
            ),
          ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CircularProgressIndicatorPainter extends CustomPainter {
  final Color color;
  final double value;
  final double size;
  final double width;

  CircularProgressIndicatorPainter({
    required this.value,
    required this.color,
    required this.size,
    required this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()..color = color;
    final outterOadius = this.size / 2;
    final innerRadius = this.size / 2 - width;

    final phaseAngle = (value * 2 * pi);
    final currentAngle = phaseAngle + (value * 2 * pi); // - pi / 2;
    final sweepAngle = (value <= 0.5 ? (value * 2 * pi) : ((1 - value) * 2 * pi));
    final startAngle = currentAngle - sweepAngle / 2;

    Path path = Path();
    path.addArc(
      Rect.fromPoints(Offset(center.dx - outterOadius, center.dy - outterOadius), Offset(center.dx + outterOadius, center.dy + outterOadius)),
      startAngle,
      sweepAngle,
    );
    double x = center.dx + innerRadius * cos(startAngle + sweepAngle);
    double y = center.dy + innerRadius * sin(startAngle + sweepAngle);
    path.lineTo(x, y);
    path.addArc(
      Rect.fromPoints(Offset(center.dx - innerRadius, center.dy - innerRadius), Offset(center.dx + innerRadius, center.dy + innerRadius)),
      startAngle + sweepAngle,
      -sweepAngle,
    );
    x = center.dx + outterOadius * cos(startAngle);
    y = center.dy + outterOadius * sin(startAngle);
    path.lineTo(x, y);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
