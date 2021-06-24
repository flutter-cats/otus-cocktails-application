import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/state/favorites_store.dart';
import 'package:lesson_21_animations_homework/ui/pages/random_cocktail_page.dart';
import 'package:lesson_21_animations_homework/ui/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Меняем writePolicy, чтобы Observable могли быть изменены только внутри экшенов
  mainContext.config = ReactiveConfig.main.clone(
    writePolicy: ReactiveWritePolicy.always,
  );

  runApp(CocktailOfDayApp());
}

final repository = AsyncCocktailRepository();

class CocktailOfDayApp extends StatelessWidget {
  static const String defaultRoute = '/home';

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => FavoritesStore(),
        child: MaterialApp(
          darkTheme: mainThemeData,
          themeMode: ThemeMode.dark,
          initialRoute: CocktailOfDayApp.defaultRoute,
          routes: {
            CocktailOfDayApp.defaultRoute: (context) =>
                RandomCocktailPageWidget(repository),
          },
        ));
  }

}
