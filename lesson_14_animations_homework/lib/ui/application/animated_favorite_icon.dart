import 'package:flutter/material.dart';

class AnimatedFavoriteIcon extends StatefulWidget {
  const AnimatedFavoriteIcon(
      {Key? key, required this.width, required this.isFavorite})
      : super(key: key);

  final bool isFavorite;
  final double width;
  @override
  State<AnimatedFavoriteIcon> createState() => _AnimatedFavoriteIconState();
}

class _AnimatedFavoriteIconState extends State<AnimatedFavoriteIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late Animation<double> _animation;
  late double w;
  late double h;
  late Size size;
  late bool isFavorite;

  @override
  void initState() {
    w = widget.width;
    h = w * 18.5 / 20;
    isFavorite = widget.isFavorite;

    Tween<double> _scaleTween = Tween(
      begin: 1,
      end: 1.2,
    );
    _animation = _scaleTween.animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            isFavorite = !isFavorite;
          });
          _controller.reverse();
        }
      });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _controller.forward();
              });
            },
            child: CustomPaint(
              painter: HeartPainter(isFavorite: isFavorite),
              size: Size(w * _animation.value, h * _animation.value),
            ),
          );
        });
  }
}

class HeartPainter extends CustomPainter {
  HeartPainter({required this.isFavorite});

  final bool isFavorite;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint
      ..color = Colors.white
      ..style = isFavorite ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width * 0.09;

    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
