import 'package:flutter/material.dart';

class FavoritWidjet extends StatefulWidget {
  bool isFavorit;
  FavoritWidjet({Key? key, required this.isFavorit});

  @override
  _FavoritWidjetState createState() => _FavoritWidjetState();
}

class _FavoritWidjetState extends State<FavoritWidjet>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 200),
    lowerBound: 0.0,
    upperBound: 0.2,
  )..addListener(() {
      setState(() {});
    });

  late double _scale;

  @override
  void initState() {
    // need set init state for controller
    _controller.value = widget.isFavorit ? 0 : 0.2;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateFavorit() {
    if (widget.isFavorit) {
      widget.isFavorit = false;
      _controller.forward();
    } else {
      widget.isFavorit = true;
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    // return Container(
    //   child: IconButton(
    //       icon: Transform.scale(
    //         scale: _scale,
    //         child: Icon(
    //           widget.isFavorit ? Icons.favorite : Icons.favorite_border,
    //           color: Colors.white,
    //           size: 30,
    //         ),
    //       ),
    //       onPressed: () => _updateFavorit()),
    // );

    // custom Paint Heart
    return Container(
      child: GestureDetector(
        onTap: () => _updateFavorit(),
        child: Transform.scale(
          scale: _scale,
          child: CustomPaint(
            size: Size(30, 35),
            painter:
                HeartPainter(color: Colors.white, isFill: widget.isFavorit),
          ),
        ),
      ),
    );
  }
}

class HeartPainter extends CustomPainter {
  final Color color;
  bool isFill;

  HeartPainter({Key? key, required this.color, required this.isFill});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.5;

    Paint paint1 = Paint();
    paint1
      ..color = isFill ? color : Colors.transparent
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0.5 * width, height * 0.40);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.40);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    canvas.drawPath(path, paint1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
