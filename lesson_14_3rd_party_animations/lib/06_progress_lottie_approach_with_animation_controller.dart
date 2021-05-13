import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

void main() {
  // debugPaintLayerBordersEnabled = true;
  // debugProfilePaintsEnabled = true;

  runApp(MyApp());
}

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
  late AnimationController _animationController;

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
                'assets/lottie/cat-preloader.json',
                controller: _animationController,

                // addRepaintBoundary: false,
                // height: 200,
                // width: 200,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_animationController.isAnimating) {
            _animationController.stop();
          } else {
            _animationController
              ..reset()
              ..forward();
          }
        },
        child: _animationController.isAnimating
            ? Icon(Icons.stop)
            : Icon(Icons.play_arrow),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
  }
}
