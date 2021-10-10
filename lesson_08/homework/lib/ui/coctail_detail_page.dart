import 'package:cocktail/core/src/model/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///моя домашка еще не проверена, поэтому ставлю мок
class CocktailDetailPage extends StatelessWidget {

  const CocktailDetailPage(
    this.cocktail, {
    Key? key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Route'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Open route'),
            onPressed: () {
              Navigator.of(context).pop();
              // Navigate to second route when tapped.
            },
          ),
        ));
  }
}
