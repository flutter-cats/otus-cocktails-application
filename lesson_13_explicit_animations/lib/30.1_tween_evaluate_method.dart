import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Center());

  evaluateMethod();
}

void evaluateMethod() {
  final customTickerProvider = CustomTickerProvider();

  final AnimationController controller = AnimationController(
      vsync: customTickerProvider, duration: Duration(seconds: 1));

  final doublesTween = Tween<double>(begin: 0, end: 1);
  final colorTween = ColorTween(begin: Colors.red, end: Colors.green);

  final animation = CurvedAnimation(parent: controller, curve: Curves.linear);

  controller.addListener(() {
    print('controller.value is ${controller.value}');

    var colorValue = colorTween.evaluate(controller);
    print('current colorTween value for controller is $colorValue');

    colorValue = colorTween.evaluate(animation);
    print('current colorTween value for curved animation is $colorValue');

    var doubleValue = doublesTween.evaluate(controller);
    print('current doublesTween value for controller is $doubleValue');

    doubleValue = doublesTween.evaluate(animation);
    print('current doublesTween value for animation is $doubleValue');
  });

  controller.forward();
}

class CustomTickerProvider extends TickerProvider {
  late Ticker _ticker;

  @override
  Ticker createTicker(onTick) {
    _ticker = Ticker(onTick);
    return _ticker;
  }
}
