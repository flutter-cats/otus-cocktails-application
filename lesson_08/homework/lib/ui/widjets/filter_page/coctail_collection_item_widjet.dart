import 'package:cocktail/core/models.dart';
import 'package:flutter/material.dart';

import 'package:cocktail/core/src/extensions/Color+Extensions.dart';

class CoctailCollectionItemWidjet extends StatelessWidget {
  final CocktailDefinition coctail;

  CoctailCollectionItemWidjet({@required this.coctail});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(coctail.drinkThumbUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.center,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.0),
                Colors.black.withOpacity(0.5),
              ],
            ),
          )),
          Positioned(
              left: 10,
              bottom: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coctail.name,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: HexColor("#2D2C39")),
                        borderRadius: BorderRadius.horizontal(
                            left: const Radius.circular(30),
                            right: const Radius.circular(30)),
                        color: HexColor('#201F2C')),
                    padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                    child: Text("id: ${coctail.id}",
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
