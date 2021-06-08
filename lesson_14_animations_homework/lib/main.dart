import 'package:lesson_14_animations_homework/core/models.dart';
import 'package:lesson_14_animations_homework/ui/pages/random_cocktail_page.dart';
import 'package:lesson_14_animations_homework/ui/style/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CocktailOfDayApp());
}

final repository = AsyncCocktailRepository();

class CocktailOfDayApp extends StatelessWidget {
  static const String defaultRoute = '/home';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: mainThemeData,
        themeMode: ThemeMode.dark,
        initialRoute: CocktailOfDayApp.defaultRoute,
        routes: {
          CocktailOfDayApp.defaultRoute: (context) =>
              RandomCocktailPageWidget(repository),
        },
      );
}
