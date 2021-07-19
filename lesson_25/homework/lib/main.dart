import 'package:cocktail_app_tests/core/models.dart';
import 'package:cocktail_app_tests/ui/pages/random_cocktail_page.dart';
import 'package:cocktail_app_tests/ui/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(CocktailOfDayApp());
}
http.Client httpClient = http.Client();
final repository = AsyncCocktailRepository(httpClient);

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
