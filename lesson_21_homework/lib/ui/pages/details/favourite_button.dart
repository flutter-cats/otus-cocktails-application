import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lesson_21_animations_homework/core/data/HiveBoxes.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

class FavouriteButtonWidget extends StatefulWidget {
  final CocktailDefinition definition;

  FavouriteButtonWidget(this.definition);

  @override
  State<StatefulWidget> createState() {
    return FavouriteButtonState(definition);
  }
}

class FavouriteButtonState extends State<FavouriteButtonWidget> {
  final CocktailDefinition definition;
  bool isFavourite = false;
  var box = Hive.box<CocktailDefinition>(HiveBoxes.favouriteCocktails);

  FavouriteButtonState(this.definition) {
    isFavourite = definition.isFavourite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
        label: 'Favorite Icon button',
        hint: 'Press to favorite',
        value: isFavourite.toString(),
        child: isFavourite
            ? IconButton(
                icon: Icon(Icons.favorite, color: Colors.white),
                onPressed: () {
                  removeFromBox();
                  printAllValues();
                  setState(() {
                    isFavourite = !isFavourite;
                  });
                },
              )
            : IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {
                  addToBox();
                  printAllValues();
                  setState(() {
                    isFavourite = !isFavourite;
                  });
                },
              ));
  }

  void addToBox() {
    box.put(definition.id, definition);
  }

  void removeFromBox() {
    box.delete(definition.id);
  }

  void printAllValues() {
    var list = <CocktailDefinition?>[];
    final l = box.length;
    for (int i = 0; i < l; i++) {
      list.add(box.getAt(i));
    }
    print(list.map((e) => e?.name));
  }
}
