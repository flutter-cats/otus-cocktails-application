import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homework/ui/favourite_cocktails_screen.dart';
import 'core/src/repository/async_cocktail_repository.dart';

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
      home: FavouriteCocktailsScreen(
        AsyncCocktailRepository(),
      ),
    );
  }
}
