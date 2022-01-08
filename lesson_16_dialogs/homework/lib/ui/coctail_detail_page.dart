import 'package:flutter/material.dart';
import 'package:homework/core/models.dart';

//todo
// Отобразить страницу CocktailDetailsScreen из домашнего задания с урока 4
// Получить Cocktail можно из  AsyncCocktailRepository().fetchCocktailDetails(id)

class CoctailDetailPage extends StatelessWidget {
  final Cocktail? coctail;
  const CoctailDetailPage({Key? key, required this.coctail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text(coctail!.name),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
