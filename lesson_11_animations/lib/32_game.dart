import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

double randomBorderRadius() => Random().nextDouble() * 64;

Color randomColor() {
  final random = Random();
  return Color.fromARGB(
    random.nextInt(255),
    random.nextInt(255),
    random.nextInt(255),
    random.nextInt(255),
  );
}

class ImplicitAnimationGameWidget extends StatefulWidget {
  ImplicitAnimationGameWidget({Key? key}) : super(key: key);

  @override
  ImplicitAnimationGameWidgetState createState() =>
      ImplicitAnimationGameWidgetState();
}

class ImplicitAnimationGameWidgetState
    extends State<ImplicitAnimationGameWidget> {
  final _random = Random();

  Color _color = Colors.red;
  double _width = 100;
  double _height = 100;
  double _radius = 50;
  Alignment _alignment = Alignment(0.5, 0.5);

  int _score = 0;

  Timer? _timer;

  int _countDown = 10;

  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment(0, -.1),
          child: Text(
            'Points $_score',
            style: TextStyle(color: Colors.white, fontSize: 70),
          ),
        ),
        (!_isPlaying)
            ? Align(
                alignment: Alignment(0, .1),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _beginGame();
                    });
                  },
                  child: Text(
                    'Press to start',
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ),
              )
            : Align(
                alignment: Alignment(0, -.9),
                child: Text(
                  '$_countDown',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
        (_isPlaying)
            ? GestureDetector(
                onTap: () => setState(() {
                  _increaseScore();
                  _randomize();
                }),
                // AnimatedAlign : Implicit Animation
                child: AnimatedAlign(
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 500),
                  alignment: _alignment,
                  // AnimatedContainer : Implicit Animation
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: _width,
                    height: _height,
                    decoration: BoxDecoration(
                      color: _color,
                      borderRadius: BorderRadius.circular(_radius),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _beginGame() {
    _score = 0;
    _countDown = 10;
    _isPlaying = true;
    _randomize();
    _startTimer();
  }

  void _finishGame() => _isPlaying = false;

  void _increaseScore() => _score++;

  void _randomize() {
    _color = randomColor();
    _width = _random.nextDouble() * 120 + 10;
    _height = _random.nextDouble() * 120 + 10;
    _radius = _random.nextDouble() * 50 + 10;
    _alignment = Alignment(
      _random.nextDouble() * 2 - 1,
      _random.nextDouble() * 2 - 1,
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          print(_countDown);
          if (_countDown < 1) {
            _finishGame();
            timer.cancel();
          } else {
            _countDown -= 1;
          }
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: Container(
              color: Colors.indigoAccent,
              child: ImplicitAnimationGameWidget(),
            ),
          ),
        ),
      );
}
