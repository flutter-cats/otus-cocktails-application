import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFavoriteWidget extends StatefulWidget {
  final Color color;
  final Color backgroundColor;
  final bool isFavorite;

  AdaptiveFavoriteWidget(
      {Key? key,
      this.isFavorite = false,
      this.color = Colors.white,
      this.backgroundColor = Colors.grey})
      : super(key: key);

  @override
  _AdaptiveFavoriteWidgetState createState() => _AdaptiveFavoriteWidgetState();
}

class _AdaptiveFavoriteWidgetState extends State<AdaptiveFavoriteWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  bool isFavorite = false;
  void _handleAnimationStatusChange(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reset();
    }
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener(_handleAnimationStatusChange);

    _sizeAnimation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 80.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 80.0, end: 0.0), weight: 1),
      ],
    ).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          padding: EdgeInsets.all(20),
          child: CustomPaint(
            painter: FavoriteWidgetPainter(
              scale: _sizeAnimation.value,
              isFavorite: isFavorite,
              color: widget.color,
              backgroundColor: widget.backgroundColor,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            isFavorite = !isFavorite;
            _controller.forward();
          });
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class FavoriteWidgetPainter extends CustomPainter {
  final Color color;
  final Color backgroundColor;
  final bool isFavorite;
  final double scale;

  const FavoriteWidgetPainter({
    required this.scale,
    required this.isFavorite,
    required this.color,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = color
      ..style = isFavorite ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 2;

    var _sc = scale / 100.0 + 1;
    Path path = Path()
      ..moveTo(0, -6 * _sc)
      ..cubicTo(0, -6 * _sc, 8 * _sc, -18 * _sc, 12 * _sc, -3 * _sc)
      ..cubicTo(12 * _sc, -3 * _sc, 12 * _sc, 4 * _sc, 0, 10 * _sc)
      ..moveTo(0, -6 * _sc)
      ..cubicTo(0, -6 * _sc, -8 * _sc, -18 * _sc, -12 * _sc, -3 * _sc)
      ..cubicTo(-12 * _sc, -3 * _sc, -12 * _sc, 4 * _sc, 0, 10 * _sc);

    canvas.drawPath(path, paint);

    if (scale != 0) {
      Paint paint1 = new Paint()
        ..color = backgroundColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5;
      canvas.drawCircle(Offset(0, 0), scale / 3, paint1);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
