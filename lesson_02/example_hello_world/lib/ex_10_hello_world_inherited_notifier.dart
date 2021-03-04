import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'InheritedNotifier Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpinModel(
      notifier: _controller,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Spinner(),
          Spinner(),
          Spinner(),
        ],
      ),
    );
  }
}

class Spinner extends StatelessWidget {
  const Spinner();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: SpinModel.of(context) * 2.0 * math.pi,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
        child: const Center(
          child: Text('Whee!'),
        ),
      ),
    );
  }
}

class SpinModel extends InheritedNotifier<AnimationController> {
  SpinModel({
    Key key,
    AnimationController notifier,
    Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static double of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SpinModel>()
        .notifier
        .value;
  }
}
