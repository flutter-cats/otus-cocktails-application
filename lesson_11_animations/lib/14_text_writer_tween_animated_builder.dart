import 'package:flutter/material.dart';

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

class TypeWriterTween extends Tween<String> {
  TypeWriterTween({required String begin, String? end})
      : super(begin: begin, end: end);

  @override
  String lerp(double t) {
    var currentLengthOfText = (end!.length * t).round();
    print(currentLengthOfText);
    return end!.substring(0, currentLengthOfText);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animations - TweenAnimationBuilder'),
      ),
      body: Container(
        child: TweenAnimationBuilder<String>(
          tween: TypeWriterTween(begin: '', end: 'Lorem Ipsum ' * 50),
          duration: Duration(seconds: 5),
          builder: (_, String colorValue, Widget? child) {
            return Text(colorValue);
          },
        ),
      ),
    );
  }
}
