import 'package:flutter/material.dart';
import 'package:homework/extensions/Color+Extensions.dart';
import 'package:homework/models/models.dart';
import 'package:homework/models/src/model/cocktail_type.dart';

class CoctailDetailsIngridients extends StatelessWidget {
  final Iterable<IngredientDefinition> ingridens;

  CoctailDetailsIngridients({this.ingridens});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                "Ингредиенты:",
                style: TextStyle(color: HexColor('#B1AFC6')),
              ),
            ),
            Expanded(
                child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: ingridens.length,
              itemBuilder: (ctx, i) =>
                  CoctailIngridient(ingridient: ingridens.elementAt(i)),
            )),
          ],
        ));
  }
}

class CoctailIngridient extends StatelessWidget {
  final IngredientDefinition ingridient;

  CoctailIngridient({this.ingridient});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ingridient.ingredientName,
            style: TextStyle(
                color: Colors.white, decoration: TextDecoration.underline),
          ),
          Text(ingridient.measure, style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
