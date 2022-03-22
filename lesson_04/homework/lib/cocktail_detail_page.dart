import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'AppColors.dart';

class Stars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.PRIMARY_BG_STAR,
      child: Icon(
        Icons.star,
        color: AppColors.PRIMARY_TEXT_LIGHT,
      ),
    );
  }
}

// The ListView.builder constructor takes an IndexedWidgetBuilder, which builds the children on demand.

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  get child => null;

  @override
  Widget build(BuildContext context) {
    /// TODO: Сделать верстку экрана "Карточка коктейля" по модели Cocktail cocktail
    /// Ссылка на макет
    /// https://www.figma.com/file/d2JJUBFu7Dg0HOV30XG7Z4/OTUS-FLUTTER.-%D0%A3%D1%80%D0%BE%D0%BA-3-%D0%94%D0%97?node-id=23%3A85
    ///для того чтобы весь контент поместился, необходимо использовать SingleChildScrollView()
    ///
    ///
    ///
    String mystringInstruction = cocktail.instruction;
    final letter = '-';
    final newLetter = '\u2022';
    mystringInstruction = mystringInstruction.replaceAll(letter, newLetter);
    List<String> mylistInstruction = mystringInstruction.split('\n');
    Widget iconStarOn = CircleAvatar(
      backgroundColor: AppColors.PRIMARY_BG_STAR,
      child: Icon(
        Icons.star,
        color: AppColors.PRIMARY_TEXT_LIGHT,
      ),
    );
    Widget iconStarOff = CircleAvatar(
      backgroundColor: AppColors.PRIMARY_BG_STAR,
      child: Icon(
        Icons.star,
        color: AppColors.PRIMARY_STAR_INVISIBLE,
      ),
    );
    final icons = List<Widget>.generate(5, (index) => iconStarOn);
    var icons3 = icons;
    icons3[3] = iconStarOff;
    icons3[4] = iconStarOff;

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height / 2,
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                image: DecorationImage(
                    image: Image.asset(
                      "assets/images/foto_mohito.png",
                    ).image,
                    fit: BoxFit.fitHeight),
              ),
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: SvgPicture.asset("assets/images/icon_back.svg"),
                        color: AppColors.PRIMARY_TEXT_LIGHT,
                        onPressed: () {}),
                    IconButton(
                        icon: SvgPicture.asset("assets/images/icon_out.svg"),
                        color: AppColors.PRIMARY_TEXT_LIGHT,
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
            Container(
                // height: screenSize.height / 2.2,
                color: AppColors.PRIMARY_GREY,
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          cocktail.name,
                          style: TextStyle(
                              color: AppColors.PRIMARY_TEXT_LIGHT,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            icon:
                                SvgPicture.asset("assets/images/icon_hart.svg"),
                            color: AppColors.PRIMARY_TEXT_LIGHT,
                            onPressed: () {}),
                      ],
                    ),
                    Container(
                      width: screenSize.width,
                      child: Text(
                        cocktail.id,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppColors.PRIMARY_TEXT_DARK_GREY,
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      width: screenSize.width,
                      padding: EdgeInsets.only(
                          top: 20, bottom: 0, left: 0, right: 0),
                      child: Text(
                        'Категория коктейля',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppColors.PRIMARY_TEXT_GREY,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      width: screenSize.width,
                      padding: EdgeInsets.only(
                          top: 14, bottom: 0, left: 16, right: 0),
                      child: Text(
                        cocktail.category.value.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppColors.PRIMARY_TEXT_LIGHT,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      width: screenSize.width,
                      padding: EdgeInsets.only(
                          top: 20, bottom: 0, left: 0, right: 0),
                      child: Text(
                        'Тип коктейля',
                        //textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppColors.PRIMARY_TEXT_GREY,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      width: screenSize.width,
                      padding: EdgeInsets.only(
                          top: 14, bottom: 0, left: 16, right: 0),
                      child: Text(
                        cocktail.cocktailType.value.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppColors.PRIMARY_TEXT_LIGHT,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      width: screenSize.width,
                      padding: EdgeInsets.only(
                          top: 20, bottom: 0, left: 0, right: 0),
                      child: Text(
                        'Тип стекла',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppColors.PRIMARY_TEXT_GREY,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      width: screenSize.width,
                      padding: EdgeInsets.only(
                          top: 14, bottom: 0, left: 16, right: 0),
                      child: Text(
                        cocktail.glassType.value.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppColors.PRIMARY_TEXT_LIGHT,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                )),
            Container(
                //height: 273,
                width: screenSize.width,
                color: AppColors.PRIMARY_BLACK,
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Ингредиенты:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.PRIMARY_TEXT_GREY,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                        height: 30 * cocktail.ingredients.length.toDouble(),
                        child: ListView.builder(
                          padding: EdgeInsets.all(0.0),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    cocktail.ingredients
                                        .elementAt(index)
                                        .ingredientName,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 1.5,
                                        color: AppColors.PRIMARY_TEXT_LIGHT,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    cocktail.ingredients
                                        .elementAt(index)
                                        .measure,
                                    style: TextStyle(
                                        color: AppColors.PRIMARY_TEXT_LIGHT,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: cocktail.ingredients.length,
                        )),
                  ],
                )),
            Container(
                height: 300,
                width: screenSize.width,
                color: AppColors.PRIMARY_GREY,
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Инструкции для приготовления',
                        style: TextStyle(
                            color: AppColors.PRIMARY_TEXT_GREY,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      height: 60 * mylistInstruction.length.toDouble(),
                      child: ListView.builder(
                        padding: EdgeInsets.all(0.0),
                        itemBuilder: (context, ind) {
                          return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                mylistInstruction[ind],
                                style: TextStyle(
                                    color: AppColors.PRIMARY_TEXT_LIGHT),
                              ));
                        },
                        itemCount: mylistInstruction.length,
                      ),
                    ),
                  ],
                )),
            Container(
              padding: const EdgeInsets.all(10.0),
              color: AppColors.PRIMARY_BLACK,
              height: 80,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: icons3),
            ),
          ],
        ),
      ),
    );
  }
}
