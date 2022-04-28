import 'package:hive_flutter/hive_flutter.dart';
import 'package:lesson_21_animations_homework/core/cocktails_favorites.dart';
import 'package:lesson_21_animations_homework/core/hive_helper.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/ui/pages/random_cocktail_page.dart';
import 'package:lesson_21_animations_homework/ui/style/theme.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Provider<CocktailsFavorites>(
      create: (context) => CocktailsFavorites(),
      child: MaterialApp(
        darkTheme: mainThemeData,
        themeMode: ThemeMode.dark,
        initialRoute: CocktailOfDayApp.defaultRoute,
        routes: {
          CocktailOfDayApp.defaultRoute: (context) => RandomCocktailPageWidget(repository),
        },
      ),
    );
  }
}
