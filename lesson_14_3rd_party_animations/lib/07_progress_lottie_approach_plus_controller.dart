import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: ((48.99 / 24) * 1000).toInt()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Animations - Lottie'),
      ),
      body: Center(
        child: Container(
          height: 300,
          child: Stack(
            children: <Widget>[
              Lottie.asset(
                'assets/lottie/data.json',
                controller: _controller,
                onLoaded: (LottieComposition composition) {
                  ///
                  /// здесь можем узнать более подробно про
                  /// длительность анимации Adobe After Effects
                  ///
                  /// todo: uncomment this
                  ///
                  /// _controller
                  ///   ..duration = composition.duration
                  ///   ..forward();
                },
              ),
              // Lottie.asset('assets/lottie/circle-venn-diagram-spherical-octahedron.json'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.forward(from: 0);
          }
        },
        child:
            _controller.isAnimating ? Icon(Icons.stop) : Icon(Icons.play_arrow),
      ),
    );
  }
}
