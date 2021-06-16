import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cocktail_detail_page.dart';
import 'models/src/repository/sync_cocktail_repository.dart';
import 'coctail_detail_page_with_sliver.dart';

void main() {
  final cocktail = SyncCocktailRepository().getHomeworkCocktail();

  runApp(MaterialApp(
    title: 'Flutter Demo',
    home: Material(child: CocktailDetailPage(cocktail)),
  ));
}
