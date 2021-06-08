import 'package:flutter/material.dart';

import 'flare/flare.actions.panel/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: Home(),
      ),
    );
  }
}
