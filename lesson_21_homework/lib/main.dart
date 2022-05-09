import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/ui/pages/favourites/cubit/favourites_cubit.dart';
import 'package:lesson_21_animations_homework/ui/pages/random_cocktail_page.dart';
import 'package:lesson_21_animations_homework/ui/style/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CocktailOfDayApp());
}

final repository = AsyncCocktailRepository();

class CocktailOfDayApp extends StatelessWidget {
  const CocktailOfDayApp({Key? key}) : super(key: key);
  static const String defaultRoute = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouritesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: mainThemeData,
        themeMode: ThemeMode.dark,
        initialRoute: CocktailOfDayApp.defaultRoute,
        routes: {
          CocktailOfDayApp.defaultRoute: (context) =>
              RandomCocktailPageWidget(repository),
        },
      ),
    );
  }
}
