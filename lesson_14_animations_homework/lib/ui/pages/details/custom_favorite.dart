import 'package:flutter/material.dart';

class CustomFavorite extends StatefulWidget {
  final bool isFavorite;
  const CustomFavorite({required this.isFavorite, Key? key}) : super(key: key);

  @override
  _CustomFavoriteState createState() => _CustomFavoriteState(isFavorite);
}

class _CustomFavoriteState extends State<CustomFavorite> {
  bool isFavorite;

  _CustomFavoriteState(this.isFavorite);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() => isFavorite = !isFavorite),
      child: AnimatedCrossFade(
        crossFadeState:
            isFavorite ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Duration(milliseconds: 300),
        firstChild: _HeartPainter(true),
        secondChild: _HeartPainter(false),
      ),
    );
  }
}

class _HeartPainter extends StatefulWidget {
  final bool isFavorite;
  const _HeartPainter(this.isFavorite, {Key? key}) : super(key: key);

  @override
  __HeartPainterState createState() => __HeartPainterState();
}

class __HeartPainterState extends State<_HeartPainter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      child: CustomPaint(
          painter:
              widget.isFavorite ? _FillHeartPainter() : _EmptyHeartPainter()),
    );
  }
}

class _FillHeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint
      ..color = Color.fromARGB(255, 212, 212, 212)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    Paint paint1 = Paint();
    paint1
      ..color = Colors.red
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

    canvas.drawPath(path, paint1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _EmptyHeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint
      ..color = Color.fromARGB(255, 226, 226, 226)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    Paint paint1 = Paint();
    paint1
      ..color = Color.fromARGB(0, 255, 17, 0)
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

    canvas.drawPath(path, paint1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
