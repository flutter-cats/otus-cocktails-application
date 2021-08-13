import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DartUiWidgetsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(32),
        children: [
          AnimatedGradientText(),
          const SizedBox(height: 100),
          // _buildTransformedContainer(),
          const SizedBox(height: 100),
          // _buildClipPath(),
          const SizedBox(height: 100),
          // _buildColored(),
          const SizedBox(height: 100),
          // _buildBackdropFilter(),
        ],
      ),
    );
  }

  Widget _buildGradientText() {
    final shader = ui.Gradient.linear(
      Offset.zero,
      Offset(360, 0),
      <Color>[
        Colors.purpleAccent,
        Colors.deepPurple,
      ],
    );
    final paint = Paint()..shader = shader;

    return Text(
      "Welcome back, commander!",
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w900,
        foreground: paint,
      ),
    );
  }

  Widget _buildTransformedContainer() {
    final matrix = Matrix4.skewX(0.9)..rotateZ(pi / 30);

    return Center(
      child: Container(
        // transform: matrix,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Hey there",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              Icons.add_a_photo_outlined,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClipPath() {
    return Center(
      child: ClipPath(
        clipper: _RhombusClipper(),
        child: Image.asset("assets/image.jpg"),
      ),
    );
  }

  Widget _buildColored() {
    return Center(
      child: ClipRect(
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.yellowAccent,
            BlendMode.multiply,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/image.jpg"),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text("Press me"),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackdropFilter() {
    return Stack(
      alignment: Alignment.center,
      // fit: StackFit.expand,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/image.jpg"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text("Press me"),
            ),
            const SizedBox(height: 8),
          ],
        ),
        ClipRect(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 15.0,
              sigmaY: 5.0,
            ),
            child: Container(
              alignment: Alignment.center,
              width: 200.0,
              height: 200.0,
              child: const Text('Hidden'),
            ),
          ),
        ),
      ],
    );
  }
}

class _RhombusClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) => false;
}

class AnimatedGradientText extends StatefulWidget {
  @override
  _AnimatedGradientTextState createState() => _AnimatedGradientTextState();
}

class _AnimatedGradientTextState extends State<AnimatedGradientText> with SingleTickerProviderStateMixin {
  late AnimationController _controller = _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();
  late Animation<double> _animation = Tween<double>(begin: 0, end: 1).animate(
    _controller,
  )..addListener(() => setState(() {}));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animationValue = _animation.value;
    final shader = ui.Gradient.linear(
      Offset.zero,
      Offset(360, 0),
      <Color>[Colors.deepPurple, Colors.purpleAccent, Colors.deepPurple],
      [
        animationValue - 0.25,
        animationValue,
        animationValue + 0.25,
      ],
    );
    final paint = Paint()..shader = shader;

    return Text(
      "Welcome back, commander!",
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w900,
        inherit: false,
        height: 1,
        foreground: paint,
      ),
    );
  }
}
