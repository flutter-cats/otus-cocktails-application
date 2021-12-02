import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:homework/res/widgets.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;
  final backgroundColor = 0xFF1A1927;

  @override
  Widget build(BuildContext context) {
    /// TODO: Сделать верстку экрана "Карточка коктейля" по модели Cocktail cocktail
    /// Ссылка на макет
    /// https://www.figma.com/file/d2JJUBFu7Dg0HOV30XG7Z4/OTUS-FLUTTER.-%D0%A3%D1%80%D0%BE%D0%BA-3-%D0%94%D0%97?node-id=23%3A85
    ///для того чтобы весь контент поместился, необходимо использовать SingleChildScrollView()
    ///
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageWithNavi(cocktail.drinkThumbUrl),
            Padding(
              padding: const EdgeInsets.only(
                top: 32,
                left: 26,
                right: 26,
                bottom: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      labelOfCoctail(cocktail.name),
                      favIcon(cocktail.isFavourite),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  idOfCoctail(cocktail.id),
                  categoryOfCoctail(cocktail.category),
                  typeOfCoctail(cocktail.cocktailType),
                  glassOfCoctail(cocktail.glassType),
                ],
              ),
            ),
            ingridientsBlock(cocktail),
            instructionBlock(cocktail),
            ratingBlock,
            starsBlock(),
          ],
        ),
      ),
    );
  }
}
