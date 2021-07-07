import 'package:flutter/material.dart';
import 'cocktail_detail_page.dart';
import 'models/src/repository/sync_cocktail_repository.dart';

void main() {
  final cocktail = SyncCocktailRepository().getHomeworkCocktail();
  runApp( MaterialApp(
    theme: ThemeData(
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
      fontFamily: 'SF Pro Text'
    ),
    title: 'Cocktail App',
    home: Material(child: CocktailDetailPage(cocktail)),
  ));
}


