import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'heart_painter.dart';

class HeartAnimation extends StatelessWidget {
  final bool isFavorite;
  final Animation<double> parentAnimationController;
  final Animation<double> sizeAnimation;

  static const Curve curve = Curves.bounceIn;

  HeartAnimation(
      {Key? key,
      required this.parentAnimationController,
      required this.isFavorite})
      : sizeAnimation = Tween<double>(begin: 1, end: 1.2).animate(
          CurvedAnimation(
            parent: parentAnimationController,
            curve: Interval(
              0,
              1,
              curve: curve,
            ),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: parentAnimationController,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return SizedBox(
        width: 24,
        height: 24,
        child: Padding(
            padding: EdgeInsets.all(4 - (sizeAnimation.value - 1) * 16),
            child: CustomPaint(
                size: Size(sizeAnimation.value * 16, sizeAnimation.value * 16),
                painter: HeartPainter(isFavorite?PaintingStyle.fill:PaintingStyle.stroke))));
  }
}

class AnimatedHeart extends StatefulWidget {
  final bool isFavorite;

  AnimatedHeart(this.isFavorite);

  @override
  _AnimatedHeart createState() => _AnimatedHeart();
}

class _AnimatedHeart extends State<AnimatedHeart>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.5; // 1.0 is normal animation speed.
    return GestureDetector(
      onTap: () async {
        await _controller.forward();
        await _controller.reverse();
      },
      child: HeartAnimation(
        parentAnimationController: _controller,
        isFavorite: widget.isFavorite,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: (2000)),
      vsync: this,
    );

    _controller.addListener(() => setState(() {}));
  }
}
