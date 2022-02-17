import 'package:flutter/material.dart';
import 'package:homework/components/cocktail_tag.dart';

class CocktailTitle extends StatelessWidget {
  final String name;
  final String id;
  final bool isFavourite;
  final category;
  final cocktailType;
  final glassType;

  CocktailTitle({
    this.id,
    this.name,
    this.isFavourite,
    this.category,
    this.glassType,
    this.cocktailType
});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1a1927),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 10, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: TextStyle(fontSize: 20)),
                isFavourite ? Icon(Icons.favorite) : Icon(Icons.favorite_border)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text('Id: $id', style: TextStyle(color: Color(0xFF848396), fontSize: 12)),
            ),
            CocktailTag(
              title: 'Категория коктейля',
              tag: category,
            ),
            CocktailTag(
              title: 'Тип коктейля',
              tag: cocktailType
            ),
            CocktailTag(
              title: 'Тип стекла',
              tag: glassType
            )
          ],
        ),
      )
    );
  }

}