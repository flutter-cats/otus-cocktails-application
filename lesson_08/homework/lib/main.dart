import 'package:cocktail/core/models.dart';
import 'package:cocktail/ui/filter_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  // final repository = AsyncCocktailRepository();
  // final cock = await repository.fetchCocktailsByCocktailCategory(CocktailCategory.beer);
  // debugPrint(cock.toString());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CocktailsFilterScreen()
      ),
    );
//    return MaterialApp(
//      home: CocktailsFilterScreen(),
//    );
  }
}
