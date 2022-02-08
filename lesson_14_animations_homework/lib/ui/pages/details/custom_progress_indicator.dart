import 'package:flutter/material.dart';
import 'dart:math';

class CustomProgressIndicator extends StatefulWidget {
  @override
  _StateCustomProgressIndicator createState() =>
      _StateCustomProgressIndicator();
}

class _StateCustomProgressIndicator extends State<StatefulWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1200))
          ..repeat();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: _SetOfPoints(),
        );
      },
      child: FlutterLogo(size: 200),
    );
  }
}

class _SetOfPoints extends StatelessWidget {
  const _SetOfPoints({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ClipPath(
      clipper: _MyCustomClipper(), // <--
      child: Container(
        width: 100,
        height: 100,
        color: Colors.white,
      ),
    ));
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(size.width - 1, size.height / 2), radius: 1))
      ..addOval(Rect.fromCircle(
          center: Offset(size.width - 17, size.height - 17), radius: 2))
      ..addOval(Rect.fromCircle(
          center: Offset(size.width / 2, size.height - 3), radius: 3))
      ..addOval(
          Rect.fromCircle(center: Offset(19, size.height - 19), radius: 4))
      ..addOval(Rect.fromCircle(center: Offset(5, size.height / 2), radius: 5))
      ..addOval(Rect.fromCircle(center: Offset(21, 21), radius: 6))
      ..addOval(Rect.fromCircle(center: Offset(size.width / 2, 7), radius: 7))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
