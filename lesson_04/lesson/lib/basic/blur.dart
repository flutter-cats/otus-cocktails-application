import 'dart:ui';

import 'package:flutter/material.dart';

class BlurSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 0.0),
          child: Text('18+')),
    ));
  }
}
