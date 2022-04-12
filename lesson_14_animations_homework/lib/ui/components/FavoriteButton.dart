import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    Key? key,
    required this.isFavorite,
  }) : super(key: key);
  final isFavorite;
  final double size = 32;
  final double resizeFactor = 0.2;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationCurve;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    )..addListener(() {
        setState(() {});
      });

    _animationCurve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceInOut,
    );
  }

  animate() async {
    await _animationController.forward();
    await _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    var size =
        widget.size + widget.size * widget.resizeFactor * _animationCurve.value;
    var maxSize = widget.size + widget.size * widget.resizeFactor;

    return InkWell(
      onTap: animate,
      child: Container(
        child: CustomPaint(
          size: Size(maxSize, maxSize),
          painter: FavoriteButtonPainter(
            strokeColor: widget.isFavorite ? Colors.transparent : Colors.white,
            fillColor: widget.isFavorite ? Colors.red : Colors.transparent,
            currentSize: size,
          ),
        ),
      ),
    );
  }
}

class FavoriteButtonPainter extends CustomPainter {
  final Color strokeColor;
  final Color fillColor;
  final double currentSize;

  FavoriteButtonPainter({
    required this.strokeColor,
    required this.fillColor,
    required this.currentSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint strokePaint = Paint();
    strokePaint
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    Paint fillPaint = Paint();
    fillPaint
      ..color = fillColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    double width = currentSize;
    double height = currentSize;

    Path path = Path();
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
