import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/core/src/model/cocktail.dart';
import 'package:homework/core/src/model/ingredient.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
      this.cocktail, {
        required Key key,
      }) : super(key: key);

  final Cocktail cocktail;

  Container topPanel() {
    return Container(
      color: const Color(0xFF040405),
      height: 375.0,
      alignment: Alignment.center,
      child: Stack(
          children: <Widget>[
            Center(
                child: Image.network(cocktail.drinkThumbUrl)
            ),
            Row(
              children: [
                Spacer(
                    flex: 6
                ),
                SvgPicture.asset(
                    "icon_back.svg"
                ),
                Spacer(flex: 80),
                SvgPicture.asset(
                    "icon_share.svg"
                ),
                Spacer(
                    flex: 6
                )
              ],
            )
          ]
      ),
    );
  }

  Container basicInfo() {
    return Container(
      color: const Color(0xFF1A1927),
      height: 322.0,
      alignment: Alignment.center,
      child: Column(
          children: <Widget>[
            Container(
              height: 33,
            ),
            Row (
                children: [
                  Spacer(),
                  Text(
                      "${cocktail.name}",
                      style:
                      TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 20
                      )
                  ),
                  Spacer(),
                  SvgPicture.asset(
                      "icon_favorite.svg"
                  ),
                  Spacer()
                ]
            ),
            Container(
              height: 10,
            ),
            Text(
                "Id: ${cocktail.id}",
                style: TextStyle(
                    color: Color(0xFF848396),
                    fontSize: 13
                )
            ),
            Container(
              height: 20,
            ),
            Text(
                "Категория коктейля",
                style: TextStyle(
                    color: Color(0xFFEAEAEA),
                    fontSize: 14
                )
            ),
            Container(
              height: 14,
            ),
            Text(
                "${cocktail.category.name}",
                style:
                TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 15
                )
            ),
            Container(
              height: 18,
            ),
            Text(
                "Тип коктейля",
                style:
                TextStyle(
                    color: Color(0xFFEAEAEA),
                    fontSize: 14
                )
            ),
            Container(
              height: 14,
            ),
            Text(
                "${cocktail.cocktailType.name}",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 15
                )
            ),
            Container(
              height: 16,
            ),
            Text(
                "Тип стекла",
                style: TextStyle(
                    color: Color(0xFFEAEAEA),
                    fontSize: 14
                )
            ),
            Container(
              height: 16,
            ),
            Text(
                "${cocktail.glassType.name}",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 15
                )
            )
          ]
      ),
    );
  }

  Container ingredientRow({ingredient: Ingredient}) {
    return Container(
        child: Column (
            children: <Widget> [
              Row(
                  children: [
                    Spacer(flex: 1),
                    Container(
                      padding: EdgeInsets.only(
                        bottom: 1, // Space between underline and text
                      ),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(
                            color: Colors.white,
                            width: 1.0, // Underline thickness
                          ))
                      ),
                      child: Text(
                        "${ingredient.ingredientName}",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(flex: 1),
                    new Text("${ingredient.measure}",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF)
                        )
                    ),
                    Spacer(flex: 1)
                  ]
              ),
              Container(height: 16)
            ]
        )
    );
  }

  Container ingredients() {
    var ingredientsList = cocktail.ingredients.toList();
    var widgetsList = new List<Widget>.generate(
        cocktail.ingredients.length,
            (index) => ingredientRow(ingredient: ingredientsList[index])
    );
    widgetsList.insert(0,
        new Text(
            "Ингредиенты:",
            style: TextStyle(
                color: Color(0xFFB1AFC6),
                fontSize: 16
            )
        )
    );
    widgetsList.insert(0, new Container(height: 24));
    widgetsList.insert(2, new Container(height: 24));
    widgetsList.add(new Container(height: 14));
    return Container(
        color: const Color(0xFF000000),
        alignment: Alignment.center,
        child: Column(
          children: widgetsList,
        )
    );
  }

  Container instructions() {
    var instructions = cocktail.instruction.replaceAll("\n", "\n\n").replaceAll("-", "·");
    return Container(
      color: const Color(0xFF201F2C),
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(height: 24),
          Text("Инструкция для приготовления", style: TextStyle(color: Color(0xFFFFFFFF))),
          Container(height: 24),
          Row(
              children: [
                Spacer(flex: 1),
                Flexible(
                    child:
                    Text("$instructions", style: TextStyle(color: Color(0xFFFFFFFF)))
                ),
                Spacer(flex: 1)
              ]
          ),
          Container(height: 40),
        ],
      ),
    );
  }

  Container rating() {
    return Container(
      color: const Color(0xFF1A1927),
      height: 113.0,
      alignment: Alignment.center,
      child:
      Row (
        children: [
          Spacer(flex: 10),
          Image(image: AssetImage("rated.png")),
          Spacer(flex: 2),
          Image(image: AssetImage("rated.png")),
          Spacer(flex: 2),
          Image(image: AssetImage("rated.png")),
          Spacer(flex: 2),
          Image(image: AssetImage("unrated.png")),
          Spacer(flex: 2),
          Image(image: AssetImage("unrated.png")),
          Spacer(flex: 10)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            color: const Color(0xFF040405),
            height: 58,
          ),
          topPanel(),
          basicInfo(),
          ingredients(),
          instructions(),
          rating(),
        ],
      ),
    );
  }
}