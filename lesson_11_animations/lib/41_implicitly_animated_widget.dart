import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class AnimatedTextWriterWidget extends ImplicitlyAnimatedWidget {
  final String text;

  AnimatedTextWriterWidget({
    Key? key,
    required this.text,
    required Duration duration,
    Curve curve = Curves.linear,
  }) : super(duration: duration, curve: curve, key: key);

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedTextWriterState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class TypeWriterTween extends Tween<String> {
  TypeWriterTween({required String begin, String? end})
      : super(begin: begin, end: end);

  @override
  String lerp(double t) {
    var start = begin!.length;
    var currentLengthOfText = ((end!.length - start) * t).round();
    final result = end!.substring(0, start + currentLengthOfText);
    return result;
  }
}

class _AnimatedTextWriterState
    extends AnimatedWidgetBaseState<AnimatedTextWriterWidget> {
  TypeWriterTween? _textWriterTween;

  @override
  Widget build(BuildContext context) =>
      Text(_textWriterTween?.evaluate(animation)?.toString() ?? '');

  @override
  void forEachTween(TweenVisitor<dynamic?> visitor) {
    _textWriterTween = visitor(
      _textWriterTween,
      widget.text,
      (dynamic value) => TypeWriterTween(begin: value),
    ) as TypeWriterTween;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String currentValue = 'Lorem Ipsum ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animations - AnimatedPositioned'),
      ),
      body: Container(
        child: AnimatedTextWriterWidget(
          text: currentValue,
          // curve: Curves.bounceOut,
          duration: Duration(seconds: 2),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentValue += 'Lorem Ipsum ';
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
