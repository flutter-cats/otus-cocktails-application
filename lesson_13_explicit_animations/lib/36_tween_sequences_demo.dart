import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Explicit Animations - Tween - sequence'),
          ),
          body: TweenAnimateMethodDemoWidget()),
    );
  }
}

class TweenAnimateMethodDemoWidget extends StatefulWidget {
  TweenAnimateMethodDemoWidget({Key? key}) : super(key: key);

  _TweenAnimateMethodDemoWidgetState createState() =>
      _TweenAnimateMethodDemoWidgetState();
}

class _TweenAnimateMethodDemoWidgetState
    extends State<TweenAnimateMethodDemoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      width: _sizeAnimation.value,
                      height: _sizeAnimation.value,
                      color: _colorAnimation.value,
                    ),
                    left: 0,
                    bottom: 0,
                  ),
                  Positioned(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.indigoAccent,
                          width: 1.0,
                        ),
                      ),
                    ),
                    left: 0,
                    bottom: 0,
                  ),
                  Positioned(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.indigoAccent,
                          width: 1.0,
                        ),
                      ),
                    ),
                    left: 0,
                    bottom: 0,
                  ),
                  Positioned(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.indigoAccent,
                          width: 1.0,
                        ),
                      ),
                    ),
                    left: 0,
                    bottom: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {
                _controller
                  ..reset()
                  ..forward();
              },
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: () {
                _controller.stop();
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener(_handleAnimationStatusChange);

    _sizeAnimation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 50.0, end: 200.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 200.0, end: 50.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 50.0, end: 100.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 100.0, end: 50.0), weight: 1),
      ],
    ).animate(_controller);

    _colorAnimation = TweenSequence(
      [
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.green, end: Colors.redAccent),
            weight: 1),
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.redAccent, end: Colors.blueAccent),
            weight: 1),
        TweenSequenceItem(
            tween:
                ColorTween(begin: Colors.blueAccent, end: Colors.purpleAccent),
            weight: 1),
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.purpleAccent, end: Colors.green),
            weight: 1),
      ],
    ).animate(_controller);

    super.initState();
  }

  void _handleAnimationStatusChange(AnimationStatus status) {
    print(status);
    if (status == AnimationStatus.completed) {
      // _controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      // _controller.forward();
    }
  }
}
