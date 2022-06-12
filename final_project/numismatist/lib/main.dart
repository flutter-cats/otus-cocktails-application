import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:numismatist/api/client_api.dart';
import 'package:numismatist/core/appbuilder.dart';
import 'package:numismatist/repository/repository.dart';
import 'package:numismatist/state/catalogs_state.dart';
import 'package:numismatist/state/favorites_state.dart';
import 'package:numismatist/state/items_state.dart';
import 'package:numismatist/ui/image_page.dart';
import 'package:numismatist/ui/item_page.dart';
import 'package:numismatist/ui/list_page.dart';
import 'package:numismatist/ui/main_page.dart';
import 'package:numismatist/ui/start_page.dart';
import 'package:numismatist/ui/style/colors.dart';
import 'package:numismatist/ui/sync_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await AppBuilder.setup();
  final client = RestClientBuilder.setup();
  final repository = Repository(client);
  runApp(MultiProvider(providers: [
    Provider(create: (_) => CatalogsState(repository)),
    Provider(create: (_) => ItemsState(repository)),
    Provider(create: (_) => FavoritesState(repository)),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'НумизматЪ',
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', ''),
        Locale('en', ''),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColor),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColor, brightness: Brightness.dark),
      ),
      routes: Map.fromEntries(pages.map((d) => MapEntry(d.route, d.builder))),
      initialRoute: '/start',
    );
  }
}

class Page {
  final String route;
  final WidgetBuilder builder;
  const Page({required this.route, required this.builder});
}

final pages = [
  Page(
    route: '/start',
    builder: (context) => const StartPage(),
  ),
  Page(
    route: '/',
    builder: (context) => const MainPage(),
  ),
  Page(
    route: '/sync',
    builder: (context) => const SyncPage(),
  ),
  Page(
    route: '/list',
    builder: (context) => const ListPage(),
  ),
  Page(
    route: '/item',
    builder: (context) => const ItemPage(),
  ),
  Page(
    route: '/image',
    builder: (context) => const ImagePage(),
  ),
];
