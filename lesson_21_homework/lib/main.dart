
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lesson_21_animations_homework/core/src/cubit/favorits_cubit.dart';
import 'core/models.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/ui/pages/random_cocktail_page.dart';
import 'package:lesson_21_animations_homework/ui/style/theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  startMeUp() async {
  
    await Hive.initFlutter();
    Hive.registerAdapter(CocktailAdapter());
    Hive.registerAdapter(CocktailCategoryAdapter());
    
    await Hive.openBox<Cocktail>('favorits');

    runApp(CocktailOfDayApp());
  }

  startMeUp();
}

final repository = AsyncCocktailRepository();

class CocktailOfDayApp extends StatelessWidget {
  static const String defaultRoute = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritsCubit()
       ..fetchFavorits(),
      child: MaterialApp(
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
