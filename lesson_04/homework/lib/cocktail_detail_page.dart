import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:homework/extensions/Color+Extensions.dart';
import 'package:homework/widjets/CoctailDetailsHeader.dart';
import 'package:homework/widjets/CoctailDetailsInfo.dart';
import 'package:homework/widjets/CoctailDetailsIngridients.dart';
import 'package:homework/widjets/CoctailDetailsInstrictions.dart';
import 'package:homework/widjets/StarRatingWidhet.dart';

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

// Here Should be Column with different Elements
