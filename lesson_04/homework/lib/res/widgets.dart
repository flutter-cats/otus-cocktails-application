import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'text_styles.dart';

Stack imageWithNavi(String imgURL) {
  return Stack(
    children: [
      Image.network(
        imgURL,
        //cocktail.drinkThumbUrl,
        scale: 0.5,
      ),
      Positioned(
        top: 16,
        left: 16,
        child: Icon(
          Icons.arrow_back,
          size: 28,
          color: Colors.white,
        ),
      ),
      Positioned(
        top: 16,
        right: 16,
        child: Icon(
          Icons.open_in_new,
          size: 28,
          color: Colors.white,
        ),
      )
    ],
  );
}

Icon favIcon(bool isFavorite) {
  if (isFavorite)
    return Icon(
      Icons.favorite,
      size: 28,
      color: Colors.white,
    );
  else
    return Icon(
      Icons.favorite_border,
      size: 28,
      color: Colors.white,
    );
}

Text labelOfCoctail(String name) {
  return Text(
    name,
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  );
}

Text idOfCoctail(String id) {
  return Text(
    'id:$id',
    textAlign: TextAlign.start,
    style: forIDTextStyle,
  );
}

Padding categoryOfCoctail(CocktailCategory category) {
  return Padding(
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
        boxOfTypes(category.value)
      ],
    ),
  );
}

Padding typeOfCoctail(CocktailType cocktailType) {
  return Padding(
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
        boxOfTypes(cocktailType.value)
      ],
    ),
  );
}

Padding glassOfCoctail(GlassType glassType) {
  return Padding(
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
        boxOfTypes(glassType.value)
      ],
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
      text,
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

Container ratingBlock = Container(
  padding: EdgeInsets.all(30),
  width: double.infinity,
  color: Colors.white,
  // child: Row(
  //   children: [
  //     _starGenerator(true),
  //     _starGenerator(true),
  //     _starGenerator(true),
  //     _starGenerator(false),
  //     _starGenerator(false),
  //   ],
  // ),
);

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
