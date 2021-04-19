import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

bool _showDebug = false;

void main() {
  runApp(
    MaterialApp(home: IntervalCurvesDemo()),
  );
}

class IntervalCurvesAnimation extends StatelessWidget {
  final Animation<double> parentAnimationController;

  final Animation<double> parentSizeAnimation;
  final Animation<double> sizeAnimation;
  final Animation<double> rotationAnimation;
  final Animation<double> borderRadiusAnimation;
  final Animation<Color?> colorAnimation;

  static const Curve curve = Curves.ease;

  IntervalCurvesAnimation({Key? key, required this.parentAnimationController})
      : parentSizeAnimation = Tween<double>(begin: 50.0, end: 200.0).animate(
          CurvedAnimation(
            parent: parentAnimationController,
            curve: Interval(
              0,
              0.5,
              curve: curve,
            ),
          ),
        ),
        rotationAnimation = Tween<double>(begin: 0, end: -2 * (2 * pi)).animate(
          CurvedAnimation(
            parent: parentAnimationController,
            curve: Interval(
              0,
              1,
              curve: curve,
            ),
          ),
        ),
        sizeAnimation = Tween<double>(begin: 30.0, end: 200.0).animate(
          CurvedAnimation(
            parent: parentAnimationController,
            curve: Interval(
              0.5,
              1.0,
              curve: curve,
            ),
          ),
        ),
        borderRadiusAnimation = Tween<double>(begin: 50, end: 10).animate(
          CurvedAnimation(
            parent: parentAnimationController,
            curve: Interval(
              0,
              1,
              curve: curve,
            ),
          ),
        ),
        colorAnimation = ColorTween(
          begin: Colors.indigoAccent,
          end: Colors.deepOrangeAccent,
        ).animate(
          CurvedAnimation(
            parent: parentAnimationController,
            curve: Interval(
              0.5,
              0.75,
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
      height: parentSizeAnimation.value,
      width: parentSizeAnimation.value,
      child: Transform.rotate(
        angle: rotationAnimation.value,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: sizeAnimation.value,
            height: sizeAnimation.value,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadiusAnimation.value),
              color: colorAnimation.value,
            ),
          ),
        ),
      ),
    );
  }
}

class IntervalCurvesDemo extends StatefulWidget {
  @override
  _IntervalCurvesDemoState createState() => _IntervalCurvesDemoState();
}

class _IntervalCurvesDemoState extends State<IntervalCurvesDemo>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0; // 1.0 is normal animation speed.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interval Curves Animation'),
      ),
      body: GestureDetector(
        onTap: () async {
          await _controller.forward();
          await _controller.reverse();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.indigoAccent,
                      width: 1.0,
                      style: _showDebug ? BorderStyle.solid : BorderStyle.none,
                    ),
                  ),
                  child: IntervalCurvesAnimation(
                    parentAnimationController: _controller,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (_showDebug) Text(_controller.value.toStringAsFixed(2)),
              ],
            ),
          ],
        ),
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
      duration: Duration(milliseconds: (_showDebug ? 10000 : 2000)),
      vsync: this,
    );

    _controller.addListener(() => setState(() {}));
  }
}
