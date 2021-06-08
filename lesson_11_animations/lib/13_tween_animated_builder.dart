import 'package:flutter/material.dart';
import 'package:lesson_11_animations/common/flutter_icon.dart';

void main() => runApp(MyApp());

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
  static final colorTween = ColorTween(
    begin: Colors.red,
    end: Colors.yellow,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animations - TweenAnimationBuilder'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: colorTween,
          duration: Duration(seconds: 2),
          builder: (_, Color? colorValue, Widget? child) {
            return FlutterIcon(color: colorValue ?? Colors.red);
          },
        ),
      ),
    );
  }
}
