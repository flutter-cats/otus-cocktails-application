import 'package:flutter/material.dart';

import 'pages/cocktail_detail_page/cocktail_detail_page.dart';
import 'models/src/repository/sync_cocktail_repository.dart';

void main() {
  final cocktail = SyncCocktailRepository().getHomeworkCocktail();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    home: Material(child: CocktailDetailPage(cocktail)),
  ));
}
