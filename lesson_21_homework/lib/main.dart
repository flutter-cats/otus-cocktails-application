import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:koin/koin.dart';
import 'package:lesson_21_animations_homework/core/data/HiveBoxes.dart';
import 'package:lesson_21_animations_homework/core/data/di/data_base_module.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/core/src/repository/FavouriteCocktailsStore.dart';
import 'package:lesson_21_animations_homework/ui/pages/random_cocktail_page.dart';
import 'package:lesson_21_animations_homework/ui/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CocktailDefinitionAdapter());
  await Hive.openBox<CocktailDefinition>(HiveBoxes.favouriteCocktails);
  runApp(CocktailOfDayApp());
}

final repository = AsyncCocktailRepository();

class CocktailOfDayApp extends StatelessWidget {
  static const String defaultRoute = '/home';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => FavouriteCocktailsStore()),
        Provider(create: (context) => AsyncCocktailRepository())
      ],
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
