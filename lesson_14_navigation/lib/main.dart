import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/src/repository/async_cocktail_repository.dart';
import 'hero/cocktails/filter_page.dart';

void main() {
  runApp(_buildApp());
}
//
// Widget _buildApp(Widget screen) {
//   return MaterialApp(
//     themeMode: ThemeMode.dark,
//     theme: ThemeData(
//         scaffoldBackgroundColor: Colors.black,
//         accentColor: Colors.white,
//         textTheme: TextTheme(
//             bodyText1: TextStyle(color: Colors.white),
//             bodyText2: TextStyle(color: Colors.white),
//             caption: TextStyle(color: Colors.white))),
//     home: screen,
//   );
// }

//for hero sample
Widget _buildApp() {
  return MaterialApp(
    themeMode: ThemeMode.dark,
    theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        accentColor: Colors.white,
        textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
            caption: TextStyle(color: Colors.white))),
    home: CocktailsFilterScreen(AsyncCocktailRepository()),
  );
}
