import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orange.shade100,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: Home(),
      ),
    );
  }
}
