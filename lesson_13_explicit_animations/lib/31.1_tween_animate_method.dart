import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Center());

  await animateMethod();
}

Future<void> animateMethod() async {
  final customTickerProvider = CustomTickerProvider();

  final AnimationController controller = AnimationController(
      vsync: customTickerProvider, duration: Duration(seconds: 1));

  Tween<double> positionTween = Tween<double>(begin: 0, end: 300);
  ColorTween colorTween = ColorTween(begin: Colors.red, end: Colors.green);

  CurvedAnimation curvedAnimation = CurvedAnimation(
    parent: controller,
    curve: Curves.bounceOut,
    reverseCurve: Curves.bounceIn,
  );

  Animation<Color?> colorAnimation = colorTween.animate(controller);
  Animation<double> leftAnimation = positionTween.animate(curvedAnimation);

  await controller.animateTo(0.0);
  print('leftAnimation.value is ${leftAnimation.value}');
  print('colorAnimation.value is ${colorAnimation.value}');

  await controller.animateTo(0.25);
  print('leftAnimation.value is ${leftAnimation.value}');
  print('colorAnimation.value is ${colorAnimation.value}');

  await controller.animateTo(0.50);
  print('leftAnimation.value is ${leftAnimation.value}');
  print('colorAnimation.value is ${colorAnimation.value}');

  await controller.animateTo(1.0);
  print('leftAnimation.value is ${leftAnimation.value}');
  print('colorAnimation.value is ${colorAnimation.value}');
}

class CustomTickerProvider extends TickerProvider {
  late Ticker _ticker;

  @override
  Ticker createTicker(onTick) {
    _ticker = Ticker(onTick);
    return _ticker;
  }
}
