import 'package:cocktail/ui/filter_page.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        accentColor: Colors.white,
        fontFamily: 'SfProText',
        textTheme: const TextTheme(
          bodyText1: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xffFFFFFF),
              fontSize: 15),
          bodyText2:
              TextStyle(fontWeight: FontWeight.w400, color: Color(0xffFFFFFF)),
        ),
        //   tex: colo,
      ),
      home: CocktailsFilterScreen(),
    );
  }
}
