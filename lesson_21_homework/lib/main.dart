import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/ui/pages/details/cubit/rating_cubit.dart';
import 'package:lesson_21_animations_homework/ui/pages/favourites/cubit/favourites_cubit.dart';
import 'package:lesson_21_animations_homework/ui/pages/filter/cubit/selected_category_cubit.dart';
import 'package:lesson_21_animations_homework/ui/pages/random_cocktail_page.dart';
import 'package:lesson_21_animations_homework/ui/style/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
    ),
  );
  BlocOverrides.runZoned(
    () {
      runApp(const CocktailOfDayApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class CocktailOfDayApp extends StatelessWidget {
  const CocktailOfDayApp({Key? key}) : super(key: key);
  static const String defaultRoute = '/home';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AsyncCocktailRepository(),
        ),
        BlocProvider(
          create: (context) => SelectedCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => FavouritesCubit(),
        ),
        BlocProvider(
          create: (context) => RatingCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'SFPro',
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          canvasColor: CustomColors.background,
          backgroundColor: CustomColors.background,
          scaffoldBackgroundColor: CustomColors.background,
          fontFamily: 'SFPro',
        ),
        themeMode: ThemeMode.dark,
        initialRoute: CocktailOfDayApp.defaultRoute,
        routes: {
          CocktailOfDayApp.defaultRoute: (context) => RandomCocktailPageWidget(
              RepositoryProvider.of<AsyncCocktailRepository>(context)),
        },
      ),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }
}
