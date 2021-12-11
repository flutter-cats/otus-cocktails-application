import 'dart:async';

import 'package:cocktail/ui/filter_page.dart';
import 'package:flutter/material.dart';

import 'core/models.dart';

void main() {
  AsyncCocktailRepository repository = AsyncCocktailRepository();

  StreamController serverRepository = StreamController();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CocktailsFilterScreen(),
    );
  }
}
