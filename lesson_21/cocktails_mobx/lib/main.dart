import 'package:cocktails_mobx/app/state/categories/categories_store.dart';
import 'package:cocktails_mobx/app/ui/style/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'app/core/src/repository/async_cocktail_repository.dart';
import 'app/state/cocktails/cocktails_store.dart';
import 'app/state/favorites/favorites_store.dart';
import 'app/ui/root_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Меняем writePolicy, чтобы Observable могли быть изменены только внутри экшенов
  mainContext.config = ReactiveConfig.main.clone(
    writePolicy: ReactiveWritePolicy.always,
  );

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => AsyncCocktailRepository(),
        ),
        Provider(
          create: (context) => CategoriesStore(),
        ),
        Provider<CocktailsStore>(
          create: (context) => CocktailsStore(
            context.read<AsyncCocktailRepository>(),
            context.read<CategoriesStore>(),
          ),
          // !!!
          dispose: (context, value) => value.dispose(),
        ),
        Provider(
          create: (context) => FavoritesStore(),
        )
      ],
      child: MaterialApp(
        theme: mainThemeData,
        home: RootPage(),
      ),
    );
  }
}
