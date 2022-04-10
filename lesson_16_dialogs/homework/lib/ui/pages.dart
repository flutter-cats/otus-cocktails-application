import 'package:flutter/material.dart';
import 'package:homework/core/src/repository/async_cocktail_repository.dart';
import 'package:homework/ui/cocktail_detail_page.dart';
import 'package:homework/ui/favourite_cocktails_screen.dart';

class Page {
  final String route;
  final WidgetBuilder builder;

  const Page({required this.route, required this.builder});
}

final pages = [
  Page(
    route: '/',
    builder: (context) => FavouriteCocktailsScreen(AsyncCocktailRepository()),
  ),
  Page(
    route: '/details',
    builder: (context) => const CocktailDetailsScreen(),
  ),
];
