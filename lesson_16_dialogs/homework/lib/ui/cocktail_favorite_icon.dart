import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class CocktailFavoriteIcon extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback? onPressed;
  final double? size;
  final Color? color;
  const CocktailFavoriteIcon({required this.isFavorite, this.onPressed, this.size, this.color});

  @override
  _CocktailFavoriteIconState createState() => _CocktailFavoriteIconState();
}

class _CocktailFavoriteIconState extends State<CocktailFavoriteIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _curve;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 100))
      ..addListener(() {
        print(_controller.value);
        setState(() {});
      });
    _curve = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
  }

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    final double? size = widget.size ?? iconTheme.size;
    Color color = widget.color ?? iconTheme.color!;

    return InkWell(
        onTapDown: (_) {
          repeatOnce();
        },
        onTap: () {
          widget.onPressed?.call();
        },
        highlightColor: Colors.transparent,
        child: Container(
          width: size,
          height: size,
          child: CustomPaint(
            painter: CocktailFavoriteIconPainter(
              isFilled: widget.isFavorite,
              color: color,
              value: _curve.value,
            ),
          ),
        ));
  }

  void repeatOnce() async {
    await _controller.forward();
    await _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CocktailFavoriteIconPainter extends CustomPainter {
  final Color color;
  final bool isFilled;
  final double value;

  CocktailFavoriteIconPainter({required this.isFilled, required this.color, required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    var newSize = size * ((100 + (value * 20)) / 120);
    final center = Offset(size.width / 2, size.height / 2);
    final halfX = newSize.width / 4;
    final halfY = newSize.width / 4;
    final paint = Paint()
      ..color = color
      ..style = isFilled ? ui.PaintingStyle.fill : ui.PaintingStyle.stroke
      ..strokeWidth = newSize.width / 15
      ..strokeCap = ui.StrokeCap.round;

    Path path = Path();
    path.moveTo(center.dx, center.dy + 2 * halfY);
    final sweepAngle = pi * 44 / 36;
    double x = center.dx - halfX + halfX * cos(-sweepAngle);
    double y = center.dy - halfY + halfY * sin(-sweepAngle);
    path.lineTo(x, y);
    path.addArc(Rect.fromPoints(Offset(center.dx - 2 * halfX, center.dy - 2 * halfY), center), -sweepAngle, sweepAngle);
    path.addArc(Rect.fromPoints(Offset(center.dx + 2 * halfX, center.dy - 2 * halfY), center), pi, sweepAngle);
    path.lineTo(center.dx, center.dy + 2 * halfY);

    if (isFilled) {
      path.lineTo(x, y);
      path.close();
    }

    canvas.drawPath(path, paint);
    canvas.clipPath(path);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
