import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import './widjets/coctail_details/CoctailDetailsHeader.dart';
import './widjets/coctail_details/CoctailDetailsInfo.dart';
import './widjets/coctail_details/CoctailDetailsInstrictions.dart';
import './widjets/coctail_details/CoctailDetailsIngridients.dart';
import './widjets/coctail_details/StarRatingWidhet.dart';
import '../core/models.dart';
import '../core/src/extensions/Color+Extensions.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key? key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    print("Coctail Details Info $cocktail");

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: HexColor('#1A1927'),
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
                    if (cocktail.instruction.isNotEmpty)
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
