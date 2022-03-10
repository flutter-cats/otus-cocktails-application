import 'package:cocktail/core/models.dart';
import 'package:flutter/material.dart';

class CocktailCard extends StatelessWidget {
  const CocktailCard(this.cocktail, {Key? key}) : super(key: key);

  final CocktailDefinition cocktail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(child: Image.network(cocktail.drinkThumbUrl)),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment(
                        0.0, 2.0), // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      Color(0x001A1927),
                      Color(0xff0B0B12)
                    ], // red to yellow
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      cocktail.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: new BoxDecoration(
                        color: Color(0xff15151C),
                        borderRadius: new BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Text(
                        "id: ${cocktail.id}",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
