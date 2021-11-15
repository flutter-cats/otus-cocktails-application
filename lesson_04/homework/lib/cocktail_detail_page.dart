import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          height: 44,
          color: Colors.black,
        ),
        _cocktailPicture(),
        _cocktailDetails(context),
        _cocktailIngredients(),
        _cocktailInstruction(),
        _cocktailRate(),
      ],
    ));
  }

  Widget _cocktailPicture() {
    return Container(
      height: 300,
      color: Color(0x0E0D13),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: [
          Image.network(cocktail.drinkThumbUrl, fit: BoxFit.cover),
          Positioned(
              top: 18,
              left: 28,
              child: SvgPicture.asset('assets/images/icon_back.svg',
                  color: Colors.white)),
          Positioned(
              top: 17,
              right: 19,
              child: SvgPicture.asset(
                'assets/images/icon_out.svg',
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  Widget _cocktailDetails(context) {
    return Container(
        color: Color(0xFF1A1927),
        height: 345,
        child: Padding(
          padding: EdgeInsets.only(top: 33, left: 32, bottom: 24),
          child: Stack(
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.topCenter,
            fit: StackFit.expand,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 90,
                      child: Text(
                        cocktail.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Id:' + cocktail.id,
                        style: TextStyle(
                          color: Color(0xFF848396),
                          fontSize: 13,
                        ),
                      )),
                  _detailTitleText(
                      'Категория коктейля', 20, Color(0xFFEAEAEA), 14),
                  _detailDataText(cocktail.category.value),
                  _detailTitleText('Тип коктейля', 24, Color(0xFFEAEAEA), 14),
                  _detailDataText(cocktail.cocktailType.value),
                  _detailTitleText('Тип стекла', 24, Color(0xFFEAEAEA), 14),
                  _detailDataText(cocktail.glassType.value),
                ],
              ),
              if (cocktail.isFavourite)
                Positioned(
                    top: 4,
                    right: 34,
                    child: SvgPicture.asset(
                      'assets/images/icon_hart.svg',
                      color: Colors.white,
                    )),
            ],
          ),
        ));
  }

  Widget _detailTitleText(
      String text, double top, Color color, double fontSize) {
    return Padding(
        padding: EdgeInsets.only(top: 22, bottom: 10),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
          ),
        ));
  }

  Widget _cocktailIngredients() {
    return FractionallySizedBox(
        widthFactor: 1,
        child: Container(
            color: Colors.black,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 24, left: 32, bottom: 24, right: 36),
              child: Column(
                children: [
                  Text(
                    'Ингредиенты:',
                    style: TextStyle(
                      color: Color(0xFFB1AFC6),
                      fontSize: 16,
                    ),
                  ),
                  for (var i in cocktail.ingredients)
                    _cocktailIngridient(i.ingredientName, i.measure),
                ],
              ),
            )));
  }

  Widget _cocktailIngridient(String ingredientName, String measure) {
    return Padding(
        padding: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Text(
              ingredientName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                decoration: TextDecoration.underline,
              ),
            )),
            Text(
              measure,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ],
        ));
  }

  Widget _cocktailInstruction() {
    return FractionallySizedBox(
        widthFactor: 1,
        child: Container(
            color: Color(0xFF201F2C),
            child: Column(children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 24, left: 0, bottom: 0, right: 126),
                child: Text(
                  'Инструкция для приготовления:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                  padding:
                      EdgeInsets.only(top: 24, left: 32, bottom: 40, right: 23),
                  child: Column(children: [
                    Text(
                      cocktail.instruction,
                      style: TextStyle(
                          color: Colors.white, fontSize: 14, height: 1.5),
                    )
                  ])),
            ])));
  }

  Widget _detailDataText(String text) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        //color: Colors.black,
        child: Padding(
            padding: EdgeInsets.only(top: 6, right: 16, bottom: 6, left: 16),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            )));
  }
}

Widget _cocktailRate() {
  int rate = 3;
  return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
          color: Color(0xFF1A1927),
          child: Padding(
            padding: EdgeInsets.only(top: 24, left: 35, bottom: 24, right: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 1; i <= 5; i++)
                  Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFF2A293A)),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.star,
                        color: i <= rate ? Colors.white : Colors.black,
                        size: 36,
                      ))
              ],
            ),
          )));
}
