import 'package:flutter/material.dart';
import 'package:cocktail/ui/filter_page.dart';
// import 'package:cocktail/ui/cocktail_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CocktailsFilterScreen(),
      // home: Material(child: CocktailDetailPage(id: '12864')),
    );
  }
}
