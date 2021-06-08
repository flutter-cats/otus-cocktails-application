import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Center());

  animateToMethod();
}

Future<void> animateToMethod() async {
  final customTickerProvider = CustomTickerProvider();

  final AnimationController controller = AnimationController(
      vsync: customTickerProvider, duration: Duration(seconds: 1));

  ColorTween colorTween = ColorTween(begin: Colors.red, end: Colors.blue);
  Animation<Color?> animation = colorTween.animate(controller);

  await controller.animateTo(0.0);
  print('animation.value is ${animation.value}');

  await controller.animateTo(0.25);
  print('animation.value is ${animation.value}');

  await controller.animateTo(0.50);
  print('animation.value is ${animation.value}');

  await controller.animateTo(1.0);
  print('animation.value is ${animation.value}');
}

class CustomTickerProvider extends TickerProvider {
  late Ticker _ticker;

  @override
  Ticker createTicker(onTick) {
    _ticker = Ticker(onTick);
    return _ticker;
  }
}
