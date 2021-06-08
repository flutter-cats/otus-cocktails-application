import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'calculator_page.dart';
import 'trial_calculator_page.dart';

void main() {
  mainContext.config = ReactiveConfig.main.clone(
    writePolicy: ReactiveWritePolicy.always,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),
    );
  }
}
