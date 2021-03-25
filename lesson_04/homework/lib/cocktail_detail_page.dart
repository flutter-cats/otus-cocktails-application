import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:homework/widjets/CoctailDetailsHeader.dart';
import 'package:homework/widjets/CoctailDetailsInfo.dart';
import 'package:homework/widjets/CoctailDetailsIngridients.dart';
import 'package:homework/widjets/CoctailDetailsInstrictions.dart';

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
          body: Container(
            color: Colors.black,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.black,
                  // height: 1200,
                  // width: deviceSize.width,
                  child: Column(
                    children: [
                      Container(
                        height: 343,
                        child: CoctailDetailsHeader(
                          imageUrl: cocktail.drinkThumbUrl,
                        ),
                      ),
                      Container(
                        width: deviceSize.width,
                        height: 312,
                        child: CoctailDetailsInfo(
                          title: cocktail.name,
                          id: cocktail.id,
                          isFavorit: cocktail.isFavourite,
                          category: cocktail.category,
                          typeCoctail: cocktail.cocktailType,
                          typeGlass: cocktail.glassType,
                        ),
                      ),
                      Expanded(
                        child: CoctailDetailsIngridients(
                          ingridens: cocktail.ingredients,
                        ),
                      ),
                      Expanded(
                        child: CoctailDetailsInstrictions(
                          instruction: cocktail.instruction,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

// Here Should be Column with different Elements
