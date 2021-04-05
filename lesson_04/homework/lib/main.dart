import 'package:flutter/material.dart';

import 'cocktail_detail_page.dart';
import 'models/src/repository/sync_cocktail_repository.dart';

void main() {
  final cocktail = SyncCocktailRepository().getHomeworkCocktail();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    themeMode: ThemeMode.dark,
    theme: new ThemeData(
      //brightness: Brightness.light,
      //primaryColor: Colors.white,
      //backgroundColor: Colors.black,
      //accentColor: Colors.cyan[600],

      // Define the default font family.
      fontFamily: 'SF Pro Text',
    ),
    debugShowCheckedModeBanner: false,
    home: Material(
      //color: Colors.black,
      child: CocktailDetailPage(cocktail),
    ),
  ));
}
