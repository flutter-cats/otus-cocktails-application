//import 'dart:html';

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
    //Для примера вынес виджет в переменную, но вообще,
    //мне больше понравилось создавать локальные виджеты
    var _coctailHeader = Container(
      height: 300.0,
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      color: Theme.of(context).backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/images/icon_back.svg'),
          Image.asset('assets/images/coctail.jpg'),
          SvgPicture.asset('assets/images/icon_out.svg'),
        ],
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      color: Theme.of(context).backgroundColor,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _coctailHeader,
            _DescriptionCocktail(),
            _Ingridients(),
            _InstructionsZone(),
            _Stars(),
          ],
        ),
      ),
    );
  }
}

class _Stars extends StatefulWidget {
  const _Stars({
    Key key,
  }) : super(key: key);

  @override
  __StarsState createState() => __StarsState();
}

class __StarsState extends State<_Stars> {
  int _starsCount = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      //color: Colors.red,
      width: 300.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _starsCount = index;
                    });
                  },
                  icon: Icon(Icons.star, color: index <= _starsCount ? Colors.white : Colors.black)),
            ),
          );
        },
      ),
    );
  }
}

class _InstructionsZone extends StatelessWidget {
  const _InstructionsZone({
    Key key,
  }) : super(key: key);

  static const String text0 = 'Инструкции по приготовлению';
  static const String text1 = 'В большом бокале смешайте порванные листья мяты, разрезанный на кусочки лайм и сахар. Толкушкой хорошо раздавите, чтобы лайм пустил сок.';
  static const String text2 = 'Добавьте мелко нарезанную кубиками мякоть арбуза и снова слегка растолките.';
  static const String text3 = 'Добавьте ром и лед. Перемешайте и разлейте по бокалам. Сразу подавайте.';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25.0),
      padding: const EdgeInsets.all(25.0),
      color: Theme.of(context).accentColor,
      child: Column(
        children: [
          _Instructions(point: false, text: text0),
          _Instructions(point: true, text: text1),
          _Instructions(point: true, text: text2),
          _Instructions(point: true, text: text3),
        ],
      ),
    );
  }
}

class _Instructions extends StatelessWidget {
  _Instructions({
    Key key,
    this.point,
    this.text,
  }) : super(key: key);

  final bool point;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        point ? _CustomSizedBox() : const SizedBox(height: 0.0),
        Row(
          children: [
            Container(
              width: 25.0,
              child: Text(
                point ? '•' : '',
                style: const TextStyle(fontSize: 30.0, color: Colors.white),
              ),
            ),
            Expanded(
              child: Text(text),
            )
          ],
        ),
      ],
    );
  }
}

class _Ingridients extends StatelessWidget {
  const _Ingridients({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Spacer(),
              Text(
                'Ингридиенты:',
                style: Theme.of(context).textTheme.headline3,
              ),
              const Spacer(),
            ],
          ),
          _IngridientsRow(title: 'Листья мяты', value: '4 шт'),
          _IngridientsRow(title: 'Лайм', value: '½ шт'),
          _IngridientsRow(title: 'Сахар', value: '1 ст. ложка'),
          _IngridientsRow(title: 'Белый ром', value: '60 мл'),
          _IngridientsRow(title: 'Лёд', value: '½ стакана'),
          _IngridientsRow(title: 'Мякоть арбуза', value: '120 г'),
        ],
      ),
    );
  }
}

class _IngridientsRow extends StatelessWidget {
  _IngridientsRow({Key key, @required this.title, @required this.value}) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Colors.white,
              style: BorderStyle.solid,
            ),
          )),
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Text(value),
      ],
    );
  }
}

class _DescriptionCocktail extends StatelessWidget {
  const _DescriptionCocktail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      margin: const EdgeInsets.only(top: 25.0),
      padding: const EdgeInsets.only(left: 50.0, right: 25.0, top: 30.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Арбузный мохито',
                style: Theme.of(context).textTheme.headline1,
              ),
              _LikeCocktail(),
            ],
          ),
          _CustomSizedBox(),
          Text(
            'id: 12864',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          _CustomSizedBox(),
          _TypeDescriptionCocktail(text: 'Категория коктейля'),
          _Card(title: 'Cocktail'),
          _CustomSizedBox(),
          _TypeDescriptionCocktail(text: 'Тип коктейля'),
          _Card(title: 'Алкогольный'),
          _CustomSizedBox(),
          _TypeDescriptionCocktail(text: 'Тип стекла'),
          _Card(title: 'Хайбол'),
        ],
      ),
    );
  }
}

class _LikeCocktail extends StatefulWidget {
  _LikeCocktail({
    Key key,
  }) : super(key: key);

  @override
  __LikeCocktailState createState() => __LikeCocktailState();
}

class __LikeCocktailState extends State<_LikeCocktail> {
  bool _likeCocktailBool = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _likeCocktailBool == true ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
      color: _likeCocktailBool == true ? Colors.red : Colors.white,
      onPressed: () {
        setState(() {
          if (_likeCocktailBool) {
            _likeCocktailBool = false;
          } else {
            _likeCocktailBool = true;
          }
        });
      },
    );
  }
}

class _TypeDescriptionCocktail extends StatelessWidget {
  const _TypeDescriptionCocktail({Key key, this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(25), //Скругленные углы
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}

class _CustomSizedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 15.0);
  }
}
