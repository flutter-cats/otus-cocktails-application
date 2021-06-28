import 'package:cocktail/res/application_colors.dart';
import 'package:cocktail/ui/filter_page/filter_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          backgroundColor: ApplicationColors.backgroundColor,
          primaryColor: Colors.white,
          fontFamily: 'SF Pro Text'),
      home: FilterPage(),
    );
  }
}
