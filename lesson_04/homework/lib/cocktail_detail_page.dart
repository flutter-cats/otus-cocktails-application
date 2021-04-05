import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    print(cocktail.isFavourite);
    return Container(
      child: SingleChildScrollView(
          child: Column(children: [
        MainCocktailImage(cocktail: cocktail),
        MainCocktailInfo(cocktail: cocktail),
        MainCocktailIngredients(cocktail: cocktail),
        MainCocktailInstruction(cocktail: cocktail),
        MainCocktailRate()
      ])),
    );

    /// TODO: Сделать верстку экрана "Карточка коктейля" по модели Cocktail cocktail
    /// Ссылка на макет
    /// https://www.figma.com/file/d2JJUBFu7Dg0HOV30XG7Z4/OTUS-FLUTTER.-%D0%A3%D1%80%D0%BE%D0%BA-3-%D0%94%D0%97?node-id=23%3A85
    ///для того чтобы весь контент поместился, необходимо использовать SingleChildScrollView()
    ///
    ///
  }
}

class MainCocktailRate extends StatelessWidget {
  const MainCocktailRate({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
      height: 88.0,
      color: Color.fromRGBO(26, 25, 39, 1),
      child: Center(
        child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) => Container(
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(42, 41, 58, 1),
                      borderRadius: BorderRadius.circular(24)),
                  width: 48.0,
                  height: 48.0,
                  child: Icon(
                    i < 3 ? Icons.star : Icons.star_outline,
                    color: Colors.white,
                    size: 36.0,
                  ),
                )),
      ),
    );
  }
}

class MainCocktailInstruction extends StatelessWidget {
  const MainCocktailInstruction({
    Key key,
    @required this.cocktail,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(26, 25, 39, 1),
      padding: EdgeInsets.all(33),
      child: Column(
        children: [
          Text(
            'Инструкция для приготовления',
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1), fontSize: 14.0),
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            cocktail.instruction,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1), fontSize: 14.0),
          )
        ],
      ),
    );
  }
}

class MainCocktailIngredients extends StatelessWidget {
  const MainCocktailIngredients({
    Key key,
    @required this.cocktail,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 0, 0, 1),
      padding: EdgeInsets.only(top: 33, left: 33, right: 33),
      child: Column(children: [
        Text(
          'Ингредиенты',
          style: TextStyle(
              color: Color.fromRGBO(177, 175, 198, 1), fontSize: 16.0),
        ),
        Container(
          child: ListView.builder(
              itemCount: cocktail.ingredients.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) => CocktailIngredientItem(
                    name: cocktail.ingredients.elementAt(i).ingredientName,
                    value: cocktail.ingredients.elementAt(i).measure,
                  )),
        ),
      ]),
    );
  }
}

class CocktailIngredientItem extends StatelessWidget {
  const CocktailIngredientItem({
    Key key,
    @required this.name,
    @required this.value,
  }) : super(key: key);

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 14.0,
                decoration: TextDecoration.underline),
          ),
          Text(
            value,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1), fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}

class MainCocktailInfo extends StatelessWidget {
  const MainCocktailInfo({
    Key key,
    @required this.cocktail,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(26, 25, 39, 1),
      padding: EdgeInsets.only(top: 33, left: 33, right: 33),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(cocktail.name,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              Icon(
                cocktail.isFavourite ? Icons.favorite : Icons.favorite_outline,
                color: Colors.white,
                size: 24,
              )
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Text(
                'Id:${cocktail.id}',
                style: TextStyle(
                    color: Color.fromRGBO(132, 131, 150, 1), fontSize: 14.0),
              )
            ],
          ),
          SizedBox(height: 10.0),
          Column(
            children: [
              MainCocktailInfoPart(
                  name: cocktail.category.name, value: cocktail.category.value),
              MainCocktailInfoPart(
                  name: cocktail.cocktailType.name,
                  value: cocktail.cocktailType.value),
              MainCocktailInfoPart(
                  name: cocktail.glassType.name,
                  value: cocktail.glassType.value),
            ],
          )
        ],
      ),
    );
  }
}

class MainCocktailInfoPart extends StatelessWidget {
  const MainCocktailInfoPart({
    Key key,
    @required this.name,
    @required this.value,
  }) : super(key: key);

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(name,
                style: TextStyle(
                    color: Color.fromRGBO(234, 234, 234, 1), fontSize: 14.0)),
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Container(
              //width: 90.0,
              padding: EdgeInsets.only(
                  top: 6.0, left: 16.0, right: 16.0, bottom: 6.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(21, 21, 28, 1),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Text(value,
                  style: TextStyle(
                      color: Color.fromRGBO(234, 234, 234, 1), fontSize: 15.0)),
            ),
          ],
        ),
        SizedBox(height: 18.0),
      ],
    );
  }
}

class MainCocktailImage extends StatelessWidget {
  const MainCocktailImage({
    Key key,
    @required this.cocktail,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
              color: Colors.red,
              height: 375.0,
              width: double.infinity,
              child: Image.network(
                cocktail.drinkThumbUrl,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 57.0, left: 19.0, right: 19.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 28.0,
                ),
                Icon(
                  Icons.open_in_new,
                  color: Colors.white,
                  size: 28.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
