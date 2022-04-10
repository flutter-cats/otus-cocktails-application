import 'package:flutter/material.dart';
import 'package:homework/ui/pages.dart';
import 'package:homework/ui/style/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: mainThemeData,
      themeMode: ThemeMode.dark,
      routes: Map.fromEntries(pages.map((d) => MapEntry(d.route, d.builder))),
      initialRoute: '/',
    );
  }
}
