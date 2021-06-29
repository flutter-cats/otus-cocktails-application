import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fps/animations/clipper.dart';

const String imagePath = 'https://png.pngtree.com/png-vector/20201103/ourlarge/pngtree-cool-funny-chicken-mascot-design-suitable-for-restaurant-logo-or-packaging-png-image_2386471.jpg';

class Example01 extends StatelessWidget {
  const Example01({
    required this.blur,
    required this.rads,
    Key? key,
  }) : super(key: key);

  final double blur;
  final double rads;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CircleClipper(rads: rads, withComputing: false),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(500)),
            child: Image.network(imagePath),
          ),
        ),
        Positioned.fill(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(500)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
