import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Center());

  await chainAndDriveMethods();
}

Future<void> chainAndDriveMethods() async {
  final customTickerProvider = CustomTickerProvider();

  final AnimationController controller = AnimationController(
      vsync: customTickerProvider, duration: Duration(seconds: 1));

  Tween<double> positionTween = Tween<double>(begin: 0, end: 300);

  CurvedAnimation curvedAnimation = CurvedAnimation(
    parent: controller,
    curve: Curves.bounceOut,
    reverseCurve: Curves.bounceIn,
  );

  Animation<double> leftAnimation = positionTween.animate(curvedAnimation);

  ///
  /// tween chained by another tween
  ///
  final bounceOutDoublesTween =
      positionTween.chain(CurveTween(curve: Curves.bounceOut));

  Animation<double> theSameAnimation =
      bounceOutDoublesTween.animate(controller);

  ///
  /// chains bounceOutDoublesTween to animation controlled by
  /// our controller
  ///
  Animation<double> theSameAgainAnimation =
      controller.drive(bounceOutDoublesTween);

  await controller.animateTo(0.0);
  print('leftAnimation.value is ${leftAnimation.value}');
  print('theSameAnimation.value is ${theSameAnimation.value}');
  print('theSameAgainAnimation.value is ${theSameAgainAnimation.value}');

  await controller.animateTo(0.25);
  print('leftAnimation.value is ${leftAnimation.value}');
  print('theSameAnimation.value is ${theSameAnimation.value}');
  print('theSameAgainAnimation.value is ${theSameAgainAnimation.value}');

  await controller.animateTo(0.50);
  print('leftAnimation.value is ${leftAnimation.value}');
  print('theSameAnimation.value is ${theSameAnimation.value}');
  print('theSameAgainAnimation.value is ${theSameAgainAnimation.value}');

  await controller.animateTo(1.0);
  print('leftAnimation.value is ${leftAnimation.value}');
  print('theSameAnimation.value is ${theSameAnimation.value}');
  print('theSameAgainAnimation.value is ${theSameAgainAnimation.value}');
}

class CustomTickerProvider extends TickerProvider {
  late Ticker _ticker;

  @override
  Ticker createTicker(onTick) {
    _ticker = Ticker(onTick);
    return _ticker;
  }
}
