import 'package:flutter/material.dart';
import 'package:homework/core/models.dart';
import 'package:homework/ui/style/text_styles.dart';

//todo
// Отобразить страницу CocktailDetailsScreen из домашнего задания с урока 4
// Получить Cocktail можно из  AsyncCocktailRepository().fetchCocktailDetails(id)

class CoctailDetailPage extends StatelessWidget {
  final Cocktail? coctail;
  final backgroundColor = 0xFF1A1927;
  const CoctailDetailPage({Key? key, required this.coctail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(backgroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              coctail!.drinkThumbUrl!,
              scale: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 32,
                left: 26,
                right: 26,
                bottom: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        coctail!.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      coctail!.isFavourite
                          ? Icon(
                              Icons.favorite,
                              size: 28,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.favorite_border,
                              size: 28,
                              color: Colors.white,
                            )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'id:${coctail!.id}',
                    textAlign: TextAlign.start,
                    style: forIDTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 26,
                      bottom: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Категория коктейля',
                          style: commonTextStyle(),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        boxOfTypes(coctail!.category.value)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Тип коктейля',
                          style: commonTextStyle(),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        boxOfTypes(coctail!.cocktailType.value)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Тип стекла',
                          style: commonTextStyle(),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        boxOfTypes(coctail!.glassType.value)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ingridientsBlock(coctail!),
            instructionBlock(coctail!),
            starsBlock(),
          ],
        ),
      ),
    );
  }

  Container boxOfTypes(var text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 23),
      decoration: BoxDecoration(
        color: Color(0xFF15151C),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text.toString(),
        style: typesTextStyle,
      ),
    );
  }

  Container ingridientsBlock(Cocktail cocktail) {
    return Container(
      padding: EdgeInsets.only(
        top: 24,
        bottom: 24,
        left: 26,
        right: 26,
      ),
      width: double.infinity,
      color: Colors.black,
      child: Column(
        children: [
          Text(
            "Ингридиенты:",
            style: ingredientsLabel,
          ),
          ...cocktail.ingredients.map((e) => _ingredientsParse(e))
        ],
      ),
    );
  }

  Row _ingredientsParse(IngredientDefinition element) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          element.ingredientName,
          style: commonTextStyle(underscope: true),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          element.measure,
          style: commonTextStyle(),
        )
      ],
    );
  }

  Container instructionBlock(Cocktail cocktail) {
    return Container(
      color: Color(0xFF201F2C),
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 26,
        bottom: 50,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Инструкция для приготовления',
            style: commonTextStyle(),
          ),
          SizedBox(
            height: 30,
          ),
          _textSeparate(cocktail.instruction, 24),
        ],
      ),
    );
  }

  Column _textSeparate(String multyLineText, double space) {
    List<String> lines = multyLineText.split('\n');
    List<Widget> rows = [];
    for (String line in lines) {
      rows.add(
        Row(
          children: [
            Flexible(
              child: Text(
                line,
                style: commonTextStyle(),
              ),
            ),
          ],
        ),
      );
      rows.add(
        SizedBox(
          height: space,
        ),
      );
    }
    return Column(
      children: [...rows],
    );
  }

  Container starsBlock() {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 22,
        bottom: 22,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _starGenerator(true),
          _starGenerator(true),
          _starGenerator(true),
          _starGenerator(false),
          _starGenerator(false),
        ],
      ),
    );
  }

  Widget _starGenerator(bool isActive) {
    var size = 60.0;
    var iconSize = 45.0;
    if (isActive)
      return Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: Color(0xFF2A293A),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.star,
          size: iconSize,
          color: Colors.white,
        ),
      );
    else
      return Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: Color(0xFF2A293A),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.star,
          size: iconSize,
          color: Color(0xFF1A1927),
        ),
      );
  }
}
