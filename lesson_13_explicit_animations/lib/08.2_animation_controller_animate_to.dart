import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class AnimationControllerStatusesDemoWidget extends StatefulWidget {
  AnimationControllerStatusesDemoWidget({Key? key}) : super(key: key);

  _AnimationControllerStatusesDemoWidgetState createState() =>
      _AnimationControllerStatusesDemoWidgetState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title:
                Text('Explicit Animations - Animation controller - animateTo'),
          ),
          body: AnimationControllerStatusesDemoWidget()),
    );
  }
}

class _AnimationControllerStatusesDemoWidgetState
    extends State<AnimationControllerStatusesDemoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  final colors = ColorTween(begin: Colors.red, end: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: Container(
                height: 500,
                alignment: Alignment.center,
                color: _animation.value,
                child: Text(_animation.value.toString()),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text(0.toString()),
              onPressed: () {
                _controller.animateTo(0);
              },
            ),
            ElevatedButton(
              child: Text(.25.toString()),
              onPressed: () {
                _controller.animateTo(.25);
              },
            ),
            ElevatedButton(
              child: Text(.5.toString()),
              onPressed: () {
                _controller.animateTo(.5);
              },
            ),
            ElevatedButton(
              child: Text(1.toString()),
              onPressed: () {
                _controller.animateTo(1);
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _animation = colors.animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }
}
