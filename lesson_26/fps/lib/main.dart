import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fps/animations/clipper.dart';
import 'package:fps/animations/example_01.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '60 FPS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '60 FPS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  bool isPlaying = false;

  late Animation<double> blur;
  late Animation<double> rads;
  late AnimationController controller;

  late double wRand;
  late double hRand;

  Future<void> heavyOperation() async {
    int currentLimit = 10;
    int step = 0;
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      String result = '';
      for (int i = 0; i < currentLimit; i++) {
        result += i.toString();
      }
      currentLimit = (currentLimit * 1.1).toInt();
      step++;
      if (step >= 20) {
        timer.cancel();
      }
    });
  }

  Future<void> animate() async {
    await controller.forward();
    await controller.animateBack(0);
    await animate();
  }

  void start() {
    setState(() {
      isPlaying = true;
    });
    animate();
  }

  void stop() {
    setState(() {
      isPlaying = false;
    });
    controller.stop();
  }

  List<Widget> buildExamples() {
    const int limit = 50;
    List<Widget> examples = [];
    for (int i = 0; i < limit; i++) {
      examples.add(
        Positioned(
          right: i * 5 * wRand,
          top: i * 8 * hRand,
          child: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) {
              return ClipPath(
                clipper: CircleClipper(rads: rads.value, withComputing: false),
                child: child!,
              );
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(500)),
              child: Image.network(imagePath),
            ),
          ),
        ),
      );
    }
    return examples;
  }

  @override
  void initState() {
    super.initState();
    wRand = Random().nextDouble() + 1;
    hRand = Random().nextDouble() + 1.5;
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    blur = Tween<double>(begin: 0, end: 30).animate(controller);
    rads = Tween<double>(begin: 0, end: 1).animate(controller);
    // heavyOperation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: buildExamples(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: isPlaying ? stop : start,
        tooltip: isPlaying ? 'Stop' : 'Play',
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 250),
          firstChild: const Icon(Icons.stop),
          secondChild: const Icon(Icons.play_arrow_rounded),
          crossFadeState: isPlaying ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
    );
  }
}
