import 'package:flutter/material.dart';
import 'package:lesson_11_animations/common/flutter_icon.dart';
import 'dart:math' as math;

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
  double begin = 0;
  double end = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animations - TweenAnimationBuilder'),
      ),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: begin, end: end),
          duration: Duration(seconds: 1),
          curve: Curves.bounceOut,
          builder: (_, double tweenValue, Widget? child) {
            return Transform.rotate(
              angle: tweenValue * math.pi * 2,
              child: Transform.scale(
                scale: tweenValue,
                child: FlutterIcon(color: Colors.red),
              ),
            );

            return Transform(
              origin: Offset(100, 100),
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(tweenValue * math.pi * 2),
              child: FlutterIcon(color: Colors.red),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final temp = end;
            end = begin;
            begin = temp;
          });
        },
        child: Icon(Icons.play_circle_fill),
      ),
    );
  }
}
