//todo
// Отобразить страницу CocktailDetailsScreen из домашнего задания с урока 4
// Получить Cocktail можно из  AsyncCocktailRepository().fetchCocktailDetails(id)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/models.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CocktailDetailPage extends StatelessWidget {
  static const routeName = '/coctail_detail_page';

  const CocktailDetailPage(/* this.cocktail,*/ {
    Key? key,
  }) : super(key: key);

  // final Cocktail cocktail ;
  Future<Cocktail?> _getCocktailDetails(String id) {
    print('Внутри _getCocktailDetails()');
    return AsyncCocktailRepository().fetchCocktailDetails(id);
  }

  @override
  Widget build(BuildContext context) {
    final cocktailId = ModalRoute.of(context)!.settings.arguments as String;
    print('cocktail id = ${cocktailId}');

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _styledAppBar(context),
      body: FutureBuilder(
        future: _getCocktailDetails(cocktailId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {}
          if (snapshot.connectionState == ConnectionState.waiting) {}
          if (snapshot.connectionState == ConnectionState.active) {}
          if (snapshot.connectionState == ConnectionState.done) {}
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                  fontFamily: 'SfProText',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color(0xffEAEAEA),
                ),
                textAlign: TextAlign.center,
              ),
            );
          }
          if (snapshot.hasData) {
            Cocktail cocktail = snapshot.data as Cocktail;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(cocktail.drinkThumbUrl),
                  _briefPart(cocktail),
                  _ingredientsPart(cocktail),
                  _instructionPart(cocktail),
                  _ratingPart()
                ],
              ),
            );
          }
          // print('connectionState: ${snapshot.connectionState}');
          // print('data:${snapshot.data.toString()}');
          return Center(
            child: SizedBox(
              height: 60,
              child: Column(
                children: [
                  Image.asset('assets/images/shaker1.png'),
                  Text('Поиск...')
                ],
              ),
            ),
          );
        },
      ),
    );
  }

///////////////////////////////////////////////build//////////////////////////////////

  PreferredSizeWidget _styledAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset('assets/images/icon_back.svg')),
        actions: [
          IconButton(
              onPressed: null,
              icon: SvgPicture.asset('assets/images/icon_out.svg'))
        ]);
  }

  Widget _briefPart(Cocktail cocktail) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
      decoration: BoxDecoration(
        color: Color(0xff1A1927),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                cocktail.name,
                style: TextStyle(
                  fontFamily: 'SfProText',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color(0xffFFFFFF),
                ),
              ),
              SvgPicture.asset('assets/images/icon_hart.svg')
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text(
                  cocktail.id,
                  style: TextStyle(
                    fontFamily: 'SfProText',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color(0xff848396),
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          _chipsContainer('Категория коктейля', cocktail.category.value),
          _chipsContainer('Тип коктейля', cocktail.cocktailType.value),
          _chipsContainer('Тип стекла', cocktail.glassType.value)
        ],
      ),
    );
  }

  Widget _chipsContainer(String titleText, String chipsText) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              titleText,
              style: TextStyle(
                fontFamily: 'SfProText',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xffEAEAEA),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ]),
          Chip(
              backgroundColor: const Color(0xff15151C),
              label: Text(
                chipsText,
                style: TextStyle(
                  fontFamily: 'SfProText',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: const Color(0xffFFFFFF),
                ),
              ))
        ],
      ),
    );
  }

  Widget _ingredientsPart(Cocktail cocktail) {
    return Container(
        padding: const EdgeInsets.fromLTRB(32, 24, 36, 24),
        decoration: BoxDecoration(
          color: const Color(0xff000000),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text('Ингридиенты:',
                  style: TextStyle(
                    fontFamily: 'SfProText',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: const Color(0xffB1AFC6),
                  )),
            ),
            ...cocktail.ingredients.map((e) => _ingredientsContainer(e)),
          ],
        ));
  }

  Widget _ingredientsContainer(IngredientDefinition ingredient) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ingredient.ingredientName,
            style: TextStyle(
              fontFamily: 'SfProText',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: const Color(0xffFFFFFF),
            ),
          ),
          Text(
            ingredient.measure,
            style: TextStyle(
              fontFamily: 'SfProText',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: const Color(0xffFFFFFF),
            ),
          )
        ],
      ),
    );
  }

  Widget _instructionPart(Cocktail cocktail) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
        decoration: BoxDecoration(
          color: const Color(0xff201F2C),
        ),
        child: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 12),
                child: Text('Инструкция для приготовления',
                    //cocktail.instruction.toString()
                    style: TextStyle(
                      fontFamily: 'SfProText',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xffFFFFFF),
                    )),
              ),
              ..._instructionContainer(cocktail.instruction)
            ]));
  }

  List<Widget> _instructionContainer(String description) {
    List<String> data = description.split('\n');
    List<Widget> result = [];

    data.forEach((e) {
      result.add(Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(right: 8, top: 6),
                height: 4.0,
                width: 4.0,
                decoration: new BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  shape: BoxShape.circle,
                )),
            Flexible(
              child: Text(
                e.replaceAll('- ', ''),
                style: TextStyle(
                  fontFamily: 'SfProText',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color(0xffFFFFFF),
                ),
              ),
            )
          ],
        ),
      ));
    });

    return result;
  }

  Widget _ratingPart() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(color: const Color(0xff1A1927)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ratingContainer(true),
          _ratingContainer(true),
          _ratingContainer(true),
          _ratingContainer(false),
          _ratingContainer(false),
        ],
      ),
    );
  }

  Widget _ratingContainer(bool isPositive) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
      child: Container(
          height: 48.0,
          width: 48.0,
          decoration: new BoxDecoration(
            color: const Color(0xff2A293A),
            shape: BoxShape.circle,
          ),
          child: isPositive
              ? Image.asset('assets/images/Star_white.png')
              : Image.asset('assets/images/Star_black.png')),
    );
  }
}
