import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import '../core/src/widjets/CoctailDetailsHeader.dart';
import '../core/src/widjets/CoctailDetailsInfo.dart';
import '../core/src/widjets/CoctailDetailsInstrictions.dart';
import '../core/src/widjets/CoctailDetailsIngridients.dart';
import '../core/src/widjets/StarRatingWidhet.dart';
import '../core/models.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: deviceSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 343,
                      child: CoctailDetailsHeader(
                        imageUrl: cocktail.drinkThumbUrl,
                      ),
                    ),
                    Container(
                      width: deviceSize.width,
                      child: CoctailDetailsInfo(
                        title: cocktail.name,
                        id: cocktail.id,
                        isFavorit: cocktail.isFavourite,
                        category: cocktail.category,
                        typeCoctail: cocktail.cocktailType,
                        typeGlass: cocktail.glassType,
                      ),
                    ),
                    CoctailDetailsIngridients(
                      ingridens: cocktail.ingredients,
                    ),
                    CoctailDetailsInstrictions(cocktail.instruction),
                    StarRatingWidjet(
                      stars: 3,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
