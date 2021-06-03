import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:flutter_svg/flutter_svg.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class TagItem extends StatelessWidget {
  final String title;
  final tagStyle = TextStyle(color: Colors.white, fontSize: 15);
  final tagBorder = BoxDecoration(color: _colorFromHex("15151C"), borderRadius: BorderRadius.circular(30));
  TagItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Text(title, style: tagStyle),
        decoration: tagBorder
    );
  }
}

class IngredientItem extends StatelessWidget {
  final String title;
  final String quantity;
  final simpleText = TextStyle(color: Colors.white, fontSize: 14);
  final simpleTextUnderlined = TextStyle(color: Colors.white, fontSize: 14, decoration: TextDecoration.underline);
  IngredientItem(this.title, this.quantity);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: simpleTextUnderlined),
        Text(quantity, style: simpleText),
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final textStyle = TextStyle(color: Colors.white,  fontSize: 14);
  ListItem(this.title);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.fiber_manual_record, size: 6, color: Colors.white),
      title: Text(title, style: textStyle ),
      minLeadingWidth : 0,
      horizontalTitleGap: 6,
      contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
    );
  }
}

class RatingStar extends StatelessWidget {
  bool active = false;
  final color = _colorFromHex('1A1927');
  final colorActive = Colors.white;
  RatingStar(this.active);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 48, height: 48,
      decoration: BoxDecoration(
        color: _colorFromHex("2A293A"),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Icon(Icons.star, color: active ? colorActive : color, size: 32),
    );
  }
}

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
      this.cocktail, {
        Key key,
      }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        children: [
          _coctailHeader(),
          _coctailShortInfo(),
          _coctailIngredients(),
          _coctailInstructions(),
          _coctailRating(),
        ]
      ),
    );
  }

  Widget _coctailHeader() {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/coctails/watermelon-mojito.png',
              fit: BoxFit.cover,
            ),
          ]
        ),
        Positioned(
            top: 24, left: 20,
            child: Icon(Icons.arrow_back, color: Colors.white)
        ),
        Positioned(
            top: 24, right: 20,
            child: Icon(Icons.open_in_new, color: Colors.white)
        ),
      ]
    );
  }

  Widget _coctailShortInfo() {
    final titleStyle = TextStyle(color: Colors.white,  fontSize: 20);
    final idStyle = TextStyle(color: _colorFromHex("848396"), fontSize: 13);
    final subtitleStyle = TextStyle(color: _colorFromHex("EAEAEA"), fontSize: 14);

    return Container(
      color: _colorFromHex("1A1927"),
      padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 18),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Арбузный Мохито', style: titleStyle),
              Icon(Icons.favorite, color: Colors.white),
            ],
          ),
          Container(padding: EdgeInsets.only(top:5)),

          Text('Id:12864', style: idStyle),
          Container(padding: EdgeInsets.only(top:15)),

          Text('Категория коктейля', style: subtitleStyle),
          Container(padding: EdgeInsets.only(top:8)),
          TagItem('Coctail'),
          Container(padding: EdgeInsets.only(top:15)),

          Text('Тип коктейля', style: subtitleStyle),
          Container(padding: EdgeInsets.only(top:8)),
          TagItem('Алкогольный'),
          Container(padding: EdgeInsets.only(top:15)),

          Text('Тип стекла', style: subtitleStyle),
          Container(padding: EdgeInsets.only(top:8)),
          TagItem('Хайбол'),
        ]
      ),
    );
  }

  Widget _coctailIngredients() {
    final titleStyle = TextStyle(color: _colorFromHex("B1AFC6"),  fontSize: 16);

    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(30),
      child: Wrap(
        children: [
          Center(child: Text('Ингредиенты:', style: titleStyle)),
          Container(padding: EdgeInsets.only(top:24)),

          IngredientItem('Листья мяты', '4шт'),
          Container(padding: EdgeInsets.only(top:16)),

          IngredientItem('Лайм', '½ шт'),
          Container(padding: EdgeInsets.only(top:16)),

          IngredientItem('Сахар', '1 ст. ложка'),
          Container(padding: EdgeInsets.only(top:16)),

          IngredientItem('Белый ром', '60 мл'),
          Container(padding: EdgeInsets.only(top:16)),

          IngredientItem('Лед', '½ стакана'),
          Container(padding: EdgeInsets.only(top:16)),

          IngredientItem('Мякоть арбуза', '120 г'),
        ]
      )
    );
  }

  Widget _coctailInstructions() {
    final textStyle = TextStyle(color: Colors.white,  fontSize: 14);

    return Container(
        color: _colorFromHex("201F2C"),
        padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 18),
        child: Wrap(
            children: [
              Text('Инструкция для приготовления', style: textStyle),
              Container(padding: EdgeInsets.only(top:24)),

              Container(
                transform: Matrix4.translationValues(-12, 0, 0),
                child: Column(
                  children: [
                    ListItem('В большом бокале смешайте порванные листья мяты, разрезанный на кусочки лайм и сахар. Толкушкой хорошо раздавите, чтобы лайм пустил сок.'),
                    ListItem('Добавьте мелко нарезанную кубиками мякоть арбуза и снова слегка растолките.'),
                    ListItem('Добавьте ром и лед. Перемешайте и разлейте по бокалам. Сразу подавайте.'),
                  ],
                ),
              ),
          ]
        )
    );
  }

  Widget _coctailRating() {
    return Container(
        color: _colorFromHex('1A1927'),
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RatingStar(true),
            RatingStar(true),
            RatingStar(true),
            RatingStar(false),
            RatingStar(false),
          ]
        ),
    );
  }
}


