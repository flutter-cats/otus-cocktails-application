import 'package:flutter/material.dart';

import 'cocktail_detail_page.dart';
import 'models/src/repository/sync_cocktail_repository.dart';

void main() {
  final cocktail = SyncCocktailRepository().getHomeworkCocktail();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        backgroundColor: Colors.black,
        accentColor: Color.fromRGBO(25, 25, 25, 1),
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 14, color: Colors.white),
          headline1: TextStyle(fontSize: 22, color: Colors.white),
          headline2: TextStyle(fontSize: 16, color: Colors.grey[100]),
          headline3: TextStyle(fontSize: 16, color: Colors.grey[500]),
          headline4: TextStyle(fontSize: 14, color: Colors.grey[300]),
          subtitle1: TextStyle(fontSize: 12, color: Colors.white60),
          subtitle2: TextStyle(fontSize: 14, color: Colors.white),
        )),
    home: Material(child: SafeArea(child: CocktailDetailPage(cocktail))),
  ));
}
