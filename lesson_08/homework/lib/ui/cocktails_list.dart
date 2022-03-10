import 'package:flutter/material.dart';

import '../core/src/model/cocktail_definition.dart';
import 'cocktail_card.dart';

class CocktailsList extends StatelessWidget {
  const CocktailsList(this.cocktailsList, {Key? key}) : super(key: key);

  final Future<List<CocktailDefinition>> cocktailsList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CocktailDefinition>>(
      future: cocktailsList,
      builder: (BuildContext context,
          AsyncSnapshot<List<CocktailDefinition>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/loading.png"),
                  Text(
                    "Поиск...",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Text("Произошла ошибка: ${snapshot.error!.toString()}"),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text("Ничего не найдено"),
            ),
          );
        } else {
          return Expanded(
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: snapshot.data!.map((e) {
                return CocktailCard(e);
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
