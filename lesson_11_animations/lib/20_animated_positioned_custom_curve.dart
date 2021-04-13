import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:lesson_11_animations/common/flutter_icon.dart';

void main() => runApp(MyApp());

const double _logoWidth = 200;

class CustomCurve extends Curve {
  ///
  /// Returns the value of the curve at point `t`
  /// The given parametric value `t` will be between 0.0 and 1.0, inclusive.
  ///
  @override
  double transformInternal(double t) {
    // return _bounce(t);

    ///
    /// y=sin(x * 2p * 2) * .5 + .5
    ///

    final y = math.sin(t * math.pi * 2 * 5) * .5 + .5;
    return y;
  }

  double _bounce(double t) {
    if (t < 1.0 / 2.75) {
      return 7.5625 * t * t;
    } else if (t < 2 / 2.75) {
      t -= 1.5 / 2.75;
      return 7.5625 * t * t + 0.75;
    } else if (t < 2.5 / 2.75) {
      t -= 2.25 / 2.75;
      return 7.5625 * t * t + 0.9375;
    }
    t -= 2.625 / 2.75;
    return 7.5625 * t * t + 0.984375;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animations - AnimatedPositioned'),
      ),
      body: Center(
        child: Container(
          height: 300,
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                curve: CustomCurve(), //  <- curve to set physics behaviour
                left: _left,
                child: FlutterIcon(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _left = _left > 0 ? 0 : size.width - _logoWidth;
          });
        },
        child: Icon(Icons.opacity),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
