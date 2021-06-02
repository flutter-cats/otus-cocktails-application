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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 25, 39),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 25),
          child: Column(
            children: <Widget>[
              _buildImage(),
              _buildDescription(),
              _buildIngredients(),
              _buildInstruction(),
              _buildStar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Stack(
      children: [
        Image.network(cocktail.drinkThumbUrl),
        Positioned(
          top: 15,
          left: 15,
          child: SvgPicture.asset('assets/images/icon_back.svg'),
        ),
        Positioned(
          top: 15,
          right: 15,
          child: SvgPicture.asset('assets/images/icon_out.svg'),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  cocktail.name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 20,
                ),
                child: Text(
                  "Id:" + cocktail.id,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  "Категория коктейля",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(15)), //BoxDecoration
                child: Text(
                  cocktail.category.name,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 13, bottom: 8),
                child: Text(
                  "Тип коктейля",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    cocktail.cocktailType.name,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15)) //BoxDecoration
              ),
              Padding(
                padding: EdgeInsets.only(top: 13, bottom: 8),
                child: Text(
                  "Тип стекла",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    cocktail.glassType.name,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(13)) //BoxDecoration
              ),
            ],
          ),
          Positioned(
            top: 5,
            right: 5,
            child: SvgPicture.asset('assets/images/icon_hart.svg'),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredients() {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.black,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 1),
          child: Text(
            "Ингредиенты:",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
        Container(
          child: Column(
            children: cocktail.ingredients
                .map(
                  (e) => Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                            BorderSide(width: 1.0, color: Colors.white),
                          ),
                        ),
                        child: Text(
                          e.ingredientName,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        e.measure,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            )
                .toList(),
          ),
        ),
      ]),
    );
  }

  Widget _buildInstruction() {
    return Container(
      color: Color.fromARGB(255, 32, 31, 44),
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "Инструкция для приготовления",
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          Text(
            cocktail.instruction,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStar() {
    final stars = List<Widget>.generate(
      5,
          (index) => Flexible(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Icon(
            Icons.star,
            size: 35,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 42, 41, 58),
              shape: BoxShape.circle), //BoxDecoration
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: stars,
      ),
    );
  }
}
