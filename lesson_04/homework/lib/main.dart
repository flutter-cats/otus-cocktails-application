import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/pages/detail/cocktail_detail_page.dart';
import 'models/src/repository/sync_cocktail_repository.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
    ),
  );
  final cocktail = SyncCocktailRepository().getHomeworkCocktail();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'SFPro',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'SFPro',
      ),
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      home: Material(
        child: CocktailDetailPage(
          cocktail,
          rating: 2,
        ),
      ),
    ),
  );
}
