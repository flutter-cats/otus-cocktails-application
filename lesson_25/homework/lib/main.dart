import 'package:cocktail_app_tests/core/cocktails_favorites.dart';
import 'package:cocktail_app_tests/core/hive_helper.dart';
import 'package:cocktail_app_tests/core/models.dart';
import 'package:cocktail_app_tests/ui/pages/random_cocktail_page.dart';
import 'package:cocktail_app_tests/ui/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CocktailDefinitionAdapter());
  await Hive.openBox(HiveHelper.boxName);

  runApp(CocktailOfDayApp());
}

final repository = AsyncCocktailRepository();

class CocktailOfDayApp extends StatelessWidget {
  static const String defaultRoute = '/home';

  @override
  Widget build(BuildContext context) => Provider<CocktailsFavorites>(
      create: (context) => CocktailsFavorites(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: mainThemeData,
        themeMode: ThemeMode.dark,
        initialRoute: CocktailOfDayApp.defaultRoute,
        routes: {
          CocktailOfDayApp.defaultRoute: (context) => RandomCocktailPageWidget(repository),
        },
      ));
}
