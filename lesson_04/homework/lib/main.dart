import 'package:flutter/material.dart';

import 'ui/cocktail_detail_page/cocktail_detail_page.dart';
import 'models/src/repository/sync_cocktail_repository.dart';

void main() {
  final cocktail = SyncCocktailRepository().getHomeworkCocktail();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(backgroundColor: Colors.black, fontFamily: 'SF Pro Text'),
    home: Material(child: CocktailDetailPage(cocktail)),
  ));
}
