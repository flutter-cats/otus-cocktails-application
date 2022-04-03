import 'package:flutter/material.dart';

class AnimatedLike extends StatefulWidget{
  final bool isFavourite;
  final Color? color;

  const AnimatedLike({required this.isFavourite, this.color});

  @override
  _AnimatedLikeState createState() => _AnimatedLikeState(isFavourite, color);
}

class _AnimatedLikeState extends State<AnimatedLike> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scaleAnimation;
  late bool isFavourite;
  late final Color? color;

  _AnimatedLikeState(bool isFavorite, Color? color) {
    this.isFavourite = isFavorite;
    this.color = color;
  }

  @override
  initState() {
    _controller = AnimationController(
      lowerBound: 1,
      upperBound: 1.2,
      duration: Duration(milliseconds: 400),
      vsync: this
    );
    scaleAnimation = Tween<double>(
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
    ..addListener(() {
      if(_controller.isCompleted) {
        _controller.reverse();
      }
      setState(() {});
    });
    super.initState();
  }

  void _onChange() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTap: _onChange,
          child: Container(
            height: 30,
            width: 30,
            child: Transform.scale(
              scale: _controller.isDismissed ?
              1 : _controller.value,
              child: CustomPaint(
                painter: LikePainter(
                    isFavourite: true,
                    color: color
                ),
              ),
            ),
          ),
        )
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class LikePainter extends CustomPainter {
  late final bool isFavourite;
  late final Color? color;

  LikePainter({required this.isFavourite, this.color});

  @override
  void paint(Canvas canvas, Size size) {

    Color finalColor = color != null ? color! : Colors.grey;

    Paint outlined = Paint()
      ..color = finalColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    Paint filled = Paint()
      ..color = finalColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    isFavourite ? canvas.drawPath(path, outlined)
        : canvas.drawPath(path, filled);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}