import 'package:flutter/material.dart';

import 'widgets/custom_paint_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skia examples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home:CustomPaintExample(),
      // home: FormExample(),
    );
  }
}
