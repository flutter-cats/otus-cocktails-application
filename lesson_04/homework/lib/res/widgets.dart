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
    style: forIDTextStyle(),
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
      style: typesTextStyle(),
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
          style: ingredientsLabel(),
        ),
      ],
    ),
  );
}

_getIngredients(Iterable<IngredientDefinition> ingredients) {
  Row listOfRows = Row(
    children: [Text('jkbhfdkjbdfg')],
  );
  return listOfRows;
}

Row ingredientsParse(IngredientDefinition element) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [Text(element.ingredientName), Text(element.measure)],
  );
}
