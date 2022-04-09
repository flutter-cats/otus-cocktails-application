import 'package:flutter/material.dart';

import '../../core/src/model/cocktail_definition.dart';
import 'cocktail_tag_id.dart';

class SearchResultCard extends StatelessWidget {
  late final CocktailDefinition definition;

  SearchResultCard({required this.definition});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          DecoratedBox(
            position: DecorationPosition.foreground,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.0),
                  Colors.black.withOpacity(1),
                ],
              ),
            ),
            child: Image.network(
              definition.drinkThumbUrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(),
                Text(
                  definition.name,
                  style: TextStyle(fontSize: 15, overflow: TextOverflow.visible),
                ),
                CocktailTagId(id: definition.id)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
