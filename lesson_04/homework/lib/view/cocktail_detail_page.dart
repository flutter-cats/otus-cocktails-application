import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/view/widgets/description_detail.dart';
import 'package:homework/view/widgets/ingredient.dart' as I;

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(cocktail.drinkThumbUrl,
                    height: 343, fit: BoxFit.fill),
                Description(
                  id: cocktail.id,
                  name: cocktail.name,
                  cocktailType: cocktail.cocktailType.value,
                  category: cocktail.category.value,
                  glassType: cocktail.glassType.value,
                ),
                Ingredients(ingredients: cocktail.ingredients),
                Instruction(
                  instruction: cocktail.instruction,
                ),
                Stars(rate: 2),
              ]),
        ),
        Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(left: 28, right: 19, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/images/icon_back.svg',
                  width: 16,
                  height: 16,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              Spacer(),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/images/icon_out.svg',
                  width: 18,
                  height: 18,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class Description extends StatelessWidget {
  Description(
      {Key key,
      this.id,
      this.name,
      this.category,
      this.cocktailType,
      this.glassType})
      : super(key: key);

  final String id;
  final String name;
  final String cocktailType;
  final String category;
  final String glassType;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1A1927),
      padding: EdgeInsets.only(top: 33, left: 32, right: 32, bottom: 18),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    child: Text(
                  name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/icon_hart.svg',
                    width: 20,
                    height: 18,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  onPressed: () {},
                  constraints: BoxConstraints(minHeight: 24),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.only(bottom: 2),
                child: Text(
                  'id:$id',
                  style: TextStyle(fontSize: 13, color: Color(0xFF848396)),
                )),
            DescriptionDetail(
              title: 'Категория коктейля',
              description: category,
            ),
            DescriptionDetail(
              title: 'Тип коктейля',
              description: cocktailType,
            ),
            DescriptionDetail(
              title: 'Тип стекла',
              description: glassType,
            ),
          ]),
    );
  }
}

class Ingredients extends StatelessWidget {
  Ingredients({Key key, this.ingredients}) : super(key: key);

  final Iterable ingredients;

  @override
  Widget build(BuildContext context) {
    List<Widget> _list = [
      Text(
        'Ингредиенты:',
        style: TextStyle(fontSize: 16, color: Color(0xFFB1AFC6)),
      ),
      SizedBox(
        height: 8,
      ),
    ];
    ingredients.forEach((e) => _list.add(I.Ingredient(
          name: e.ingredientName,
          measure: e.measure,
        )));
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(top: 24, left: 32, right: 36, bottom: 24),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _list),
    );
  }
}

class Instruction extends StatelessWidget {
  const Instruction({Key key, this.instruction}) : super(key: key);
  final String instruction;
  @override
  Widget build(BuildContext context) {
    List<Widget> _wList = [
      Container(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            'Инструкция для приготовления',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ))
    ];
    List<String> _ilist = LineSplitter().convert(instruction);
    _ilist.forEach(
      (e) {
        _wList.add(SizedBox(
          height: 16,
        ));
        _wList.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 16,
              child: Container(
                height: 4,
                width: 4,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  e.substring(2),
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            )
          ],
        )
            //Text.rich(
            //  TextSpan( children:<InlineSpan>[
            // WidgetSpan(
            //   alignment: PlaceholderAlignment.middle,
            //   baseline: TextBaseline.alphabetic,
            //   child: Container(
            // height: 4, width: 4, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),)),
            // WidgetSpan(child: SizedBox(width: 8,)),
            // TextSpan(text: e.substring(2), style: TextStyle(fontSize: 14, color: Colors.white,  ),  )
            //],
            // ),
            // textAlign: TextAlign.left,
            // softWrap: true,
            //)
            );
      },
    );

    return Container(
      color: Color(0xFF201F2C),
      padding: EdgeInsets.only(top: 24, bottom: 40, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _wList,
      ),
    );
  }
}

class Stars extends StatelessWidget {
  Stars({Key key, this.rate}) : super(key: key);
  final int rate;
  @override
  Widget build(BuildContext context) {
    Color starColor = Colors.white;
    List<Widget> _list = List.generate(5, (index) {
      if (index > rate) starColor = Color(0xFF1A1927);
      return Container(
        alignment: Alignment.center,
        width: 48,
        height: 48,
        decoration:
            BoxDecoration(color: Color(0xFF2A293A), shape: BoxShape.circle),
        child: Icon(
          Icons.star_rate,
          size: 32,
          color: starColor,
        ),
      );
    });

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 96,
      color: Color(0xFF1A1927),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _list,
      ),
    );
  }
}
