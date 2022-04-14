import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressCustom extends StatefulWidget {
  /// Создает анимированный виджет индикатора загрузчика
  ///
  /// Можно изменять размер [size], цвет [color], длительность [duration]
  /// и ширину линии [strokeWidth]
  const CircularProgressCustom({
    Key? key,
    this.size = 50.0,
    this.color = Colors.grey,
    this.duration = const Duration(milliseconds: 1800),
    this.strokeWidth = 4.0,
  }) : super(key: key);

  final Duration duration;
  final double size;
  final Color color;
  final double strokeWidth;

  @override
  State<CircularProgressCustom> createState() => _CircularProgressCustomState();
}

class _CircularProgressCustomState extends State<CircularProgressCustom>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _startAngleAnimation, _sweepAngleAnimation, _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _startAngleAnimation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 1.3),
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.75), weight: 0.3),
        TweenSequenceItem(tween: Tween(begin: 0.75, end: 1.0), weight: 0.1),
      ],
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));

    _sweepAngleAnimation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 0.05, end: 0.8), weight: 0.3),
        TweenSequenceItem(tween: Tween(begin: 0.8, end: 0.8), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 0.8, end: 0.05), weight: 0.3),
        TweenSequenceItem(tween: Tween(begin: 0.05, end: 0.05), weight: 0.1),
      ],
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));

    _rotateAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: Transform.rotate(
              angle: 2 * pi * _rotateAnimation.value,
              child: CustomPaint(
                painter: CircularPainter(
                  color: widget.color,
                  strokeWidth: widget.strokeWidth,
                  startAngle: _startAngleAnimation.value,
                  sweepAngle: _sweepAngleAnimation.value,
                ),
              ),
            ),
          );
        });
  }
}

class CircularPainter extends CustomPainter {
  CircularPainter({
    required this.startAngle,
    required this.sweepAngle,
    required this.color,
    required this.strokeWidth,
  });

  double strokeWidth;
  Color color;
  double startAngle;
  double sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    var paintProgress = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCenter(center: center, width: size.width, height: size.height),
      2 * pi * startAngle,
      2 * pi * sweepAngle,
      false,
      paintProgress,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
