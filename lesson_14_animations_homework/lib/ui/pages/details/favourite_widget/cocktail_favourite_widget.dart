import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          child: _CocktailsFavouriteWidget(false),
        ),
      ),
    ),
  ));
}

class CocktailsFavouriteWrapper extends StatelessWidget {
  final bool isFavourite;
  final double height;
  final double width;

  CocktailsFavouriteWrapper(
      {required this.height, required this.width, this.isFavourite: false});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60, width: 60, child: _CocktailsFavouriteWidget(isFavourite));
  }
}

class _CocktailsFavouriteWidget extends StatefulWidget {
  final bool isFavourite;

  _CocktailsFavouriteWidget(this.isFavourite);

  @override
  State<StatefulWidget> createState() => _FavouriteState(isFavourite);
}

class _FavouriteState extends State with SingleTickerProviderStateMixin {
  late AnimationController controller;
  final animationDuration = Duration(milliseconds: 500);

  var isFavourite = false;

  _FavouriteState(this.isFavourite);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: animationDuration,
        lowerBound: 0.0,
        upperBound: 0.2);
  }

  void runAnimation() {
    controller
      ..forward().then((value) => controller
          .reverse()
          .then((value) => controller.stop(canceled: true)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => GestureDetector(
          onTap: () => setState(() {
                isFavourite = !isFavourite;
                runAnimation();
              }),
          child: CustomPaint(
            painter: HeartOnFire(controller.value, isFavourite),
          )),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class HeartOnFire extends CustomPainter {
  final double tick;
  final bool isFavourite;

  HeartOnFire(this.tick, this.isFavourite);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final old = oldDelegate as HeartOnFire;
    return old.tick != tick || old.isFavourite != isFavourite;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint
      ..color = Colors.red
      ..style = isFavourite ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = isFavourite ? 0 : 3;

    double width = size.width * (1 + tick);
    double height = size.height * (1 + tick);

    Path path = Path();
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    canvas.drawPath(path, paint);
  }
}
