import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

double randomWidth() => Random().nextDouble() * 400;

double randomBorderRadius() => Random().nextDouble() * 250;

Color randomColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double width = 150;
  double borderRadius = 20;
  double endRotation = 0;
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Implicit Animations - AnimatedPositioned'),
        ),
        body: Center(
          child: GestureDetector(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: endRotation),
              duration: Duration(milliseconds: 1000),
              builder: (_, double rotation, __) {
                return Transform.rotate(
                  angle: rotation,
                  child: AnimatedContainer(
                    width: width,
                    height: width,
                    curve: Curves.bounceOut,
                    duration: Duration(milliseconds: 1000),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                      color: color,
                    ),
                  ),
                );
              },
            ),
            onTap: () {
              setState(
                () {
                  endRotation = 2 * pi * 4 * Random().nextDouble();
                  width = randomWidth();
                  borderRadius = randomBorderRadius();
                  color = randomColor();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
