import 'ui/cocktail_filter_page/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'SFPro',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'SFPro',
      ),
      themeMode: ThemeMode.dark,
      title: 'Cocktail App',
      home: const Material(
        child: CocktailsFilterScreen(),
      ),
    );
  }
}
