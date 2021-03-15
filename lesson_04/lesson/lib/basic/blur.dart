import 'dart:ui';

import 'package:flutter/material.dart';

class BlurSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Text('18+')),
    ));
  }
}
