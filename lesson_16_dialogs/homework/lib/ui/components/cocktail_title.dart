import 'package:flutter/material.dart';
import 'package:homework/ui/constants.dart';

import 'cocktail_tag.dart';

class CocktailTitle extends StatelessWidget {
  final String name;
  final String id;
  final bool isFavourite;
  final category;
  final cocktailType;
  final glassType;

  CocktailTitle(
      {required this.id,
      required this.name,
      required this.isFavourite,
      required this.category,
      required this.glassType,
      required this.cocktailType});

  @override
  Widget build(BuildContext context) {
    Color iconColor = Colors.grey;
    return Container(
        color: Constants.backgroundColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 10, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: TextStyle(fontSize: 20)),
                  isFavourite
                      ? Icon(Icons.favorite, color: iconColor)
                      : Icon(Icons.favorite_border, color: iconColor)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('Id: $id',
                    style:
                        TextStyle(color: Constants.textIdColor, fontSize: 12)),
              ),
              CocktailTag(
                title: 'Категория коктейля',
                tag: category,
              ),
              CocktailTag(title: 'Тип коктейля', tag: cocktailType),
              CocktailTag(title: 'Тип стекла', tag: glassType)
            ],
          ),
        ));
  }
}
