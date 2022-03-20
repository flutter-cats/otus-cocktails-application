import 'package:flutter/material.dart';
import 'package:homework/colors.dart';
import 'package:homework/models/models.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  /// Ссылка на макет
  /// https://www.figma.com/file/d2JJUBFu7Dg0HOV30XG7Z4/OTUS-FLUTTER.-%D0%A3%D1%80%D0%BE%D0%BA-3-%D0%94%D0%97?node-id=23%3A85
  ///для того чтобы весь контент поместился, необходимо использовать SingleChildScrollView()
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.black,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Row(children: <Widget>[
                new SizedBox(
                  height: 32,
                  width: 32,
                  child: IconButton(icon: SvgPicture.asset('assets/images/icon_back.svg', color: Colors.white, height: 16, width: 16), onPressed: () => {}),
                ),
                Spacer(),
                new SizedBox(
                  height: 32,
                  width: 32,
                  child: IconButton(icon: SvgPicture.asset('assets/images/icon_out.svg', color: Colors.white), padding: EdgeInsets.zero, onPressed: () => {}),
                ),
              ])),
          body: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              ConstrainedBox(constraints: BoxConstraints(minHeight: 400), child: Image.network(cocktail.drinkThumbUrl)),
              ConstrainedBox(
                  constraints: BoxConstraints(),
                  child: Container(
                      color: BackgroundColor,
                      padding: const EdgeInsets.all(32),
                      child: Column(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Row(
                              children: [
                                Text(cocktail.name, textAlign: TextAlign.start, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
                                Spacer(),
                                if (cocktail.isFavourite)
                                  new SizedBox(
                                      height: 32,
                                      width: 32,
                                      child: IconButton(
                                          icon: SvgPicture.asset(
                                            'assets/images/icon_hart.svg',
                                            color: Colors.white,
                                            height: 16,
                                            width: 16,
                                          ),
                                          onPressed: () => {}))
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Id:${cocktail.id}", textAlign: TextAlign.start, style: TextStyle(color: IdColor, fontSize: 13, fontWeight: FontWeight.w400)))),
                        Padding(padding: EdgeInsets.only(top: 10), child: ClassText(className: 'Категория коктейля', classValue: cocktail.category.value)),
                        Padding(padding: EdgeInsets.only(top: 10), child: ClassText(className: 'Тип коктейля', classValue: cocktail.cocktailType.value)),
                        Padding(padding: EdgeInsets.only(top: 10), child: ClassText(className: 'Тип стекла', classValue: cocktail.glassType.value)),
                      ]))),
              ConstrainedBox(
                  constraints: BoxConstraints(),
                  child: Container(
                    padding: const EdgeInsets.only(top: 24, left: 32, right: 32, bottom: 24),
                    child: Column(
                      children: [
                        Text('Ингредиенты:', style: TextStyle(color: TextColor, fontSize: 16, fontWeight: FontWeight.w500)),
                        for (var ingredient in cocktail.ingredients) IngredientText(ingredientName: ingredient.ingredientName, ingredientValue: ingredient.measure)
                      ],
                    ),
                  )),
              ConstrainedBox(
                  constraints: BoxConstraints(),
                  child: Container(
                      color: BackColor,
                      padding: const EdgeInsets.only(top: 0, left: 32, right: 32, bottom: 40),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 16),
                            child: Text('Инструкция для приготовления', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400)),
                          ),
                          Text(cocktail.instruction.replaceAll('-', '·'), style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400, height: 2)),
                        ],
                      ))),
              ConstrainedBox(constraints: BoxConstraints(), child: Container(color: BackgroundColor, padding: const EdgeInsets.all(32), child: RatingBar(rating: 3))),
            ],
          ))),
    );
  }
}

class ClassText extends StatelessWidget {
  const ClassText({Key key, this.className, this.classValue}) : super(key: key);

  final String className;
  final String classValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            className,
            textAlign: TextAlign.start,
            style: TextStyle(color: ClassColor, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 8),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    decoration: BoxDecoration(
                        color: BorderColor,
                        border: Border.all(
                          color: BorderColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        classValue,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    )))),
      ],
    );
  }
}

class IngredientText extends StatelessWidget {
  const IngredientText({Key key, this.ingredientName, this.ingredientValue}) : super(key: key);

  final String ingredientName;
  final String ingredientValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          Text(
            ingredientName,
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400, decoration: TextDecoration.underline),
          ),
          Spacer(),
          Text(
            ingredientValue,
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  const RatingBar({Key key, this.rating}) : super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var i = 1; i <= 5; i++)
          ConstrainedBox(
              constraints: BoxConstraints(minHeight: 48, maxHeight: 48, maxWidth: 48, minWidth: 48),
              child: Container(
                decoration: BoxDecoration(
                    color: RatingColor,
                    border: Border.all(
                      color: RatingColor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Icon(Icons.star, size: 32, color: rating >= i ? Colors.white : Colors.transparent),
              ))
      ],
    );
  }
}
