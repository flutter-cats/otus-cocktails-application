import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  runApp(
    MaterialApp(home: IntervalCurvesDemo()),
  );
}

class IntervalCurvesAnimation extends StatelessWidget {
  final Animation<double> parentAnimation;
  final Animation<double> canvasSize;
  final Animation<double> size;
  final Animation<double> rotation;
  final Animation<double> borderRadius;
  final Animation<Color?> color;

  static const Curve curve = Curves.ease;

  IntervalCurvesAnimation({Key? key, required this.parentAnimation})
      : canvasSize = Tween<double>(begin: 50.0, end: 200.0).animate(
          CurvedAnimation(
            parent: parentAnimation,
            curve: Interval(
              0,
              0.5,
              curve: curve,
            ),
          ),
        ),
        rotation = Tween<double>(begin: 0, end: -2 * (2 * pi)).animate(
          CurvedAnimation(
            parent: parentAnimation,
            curve: Interval(
              0,
              1,
              curve: curve,
            ),
          ),
        ),
        size = Tween<double>(begin: 30.0, end: 200.0).animate(
          CurvedAnimation(
            parent: parentAnimation,
            curve: Interval(
              0.5,
              1.0,
              curve: curve,
            ),
          ),
        ),
        borderRadius = Tween<double>(begin: 50, end: 10).animate(
          CurvedAnimation(
            parent: parentAnimation,
            curve: Interval(
              0,
              1,
              curve: curve,
            ),
          ),
        ),
        color = ColorTween(
          begin: Colors.indigoAccent,
          end: Colors.deepOrangeAccent,
        ).animate(
          CurvedAnimation(
            parent: parentAnimation,
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
      animation: parentAnimation,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return SizedBox(
      height: canvasSize.value,
      width: canvasSize.value,
      child: Transform.rotate(
        angle: rotation.value,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: size.value,
            height: size.value,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius.value),
              color: color.value,
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

  bool _showDebug = false;

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
                    parentAnimation: _controller,
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
