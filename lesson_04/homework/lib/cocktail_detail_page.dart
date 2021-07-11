import 'package:flutter/material.dart';

import 'package:homework/models/models.dart';

import 'package:homework/widgets/detail_appbar.dart';
import 'package:homework/widgets/cocktail_image.dart';
import 'package:homework/widgets/details.dart';
import 'package:homework/widgets/ingredients.dart';
import 'package:homework/widgets/instruction.dart';
import 'package:homework/widgets/rating.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1927),
      extendBodyBehindAppBar: true,
      appBar: const DetailAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CocktailImage(cocktail: cocktail),
            Details(cocktail: cocktail),
            Ingredients(cocktail: cocktail),
            Instruction(cocktail: cocktail),
            const Rating(),
          ],
        ),
      ),
    );
  }
}



/// Сделать верстку экрана "Карточка коктейля" по модели Cocktail cocktail
/// Ссылка на макет
/// https://www.figma.com/file/d2JJUBFu7Dg0HOV30XG7Z4/OTUS-FLUTTER.-%D0%A3%D1%80%D0%BE%D0%BA-3-%D0%94%D0%97?node-id=23%3A85
/// для того чтобы весь контент поместился, необходимо использовать SingleChildScrollView()
