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

import 'package:homework/slivers/coctail_instructions_sliver_list.dart';

class CocktailDetailPageWithSliver extends StatelessWidget {
  const CocktailDetailPageWithSliver(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  List<String> get _instructions {
    return cocktail.instruction.split('- ').sublist(1).toList();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
              child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: Column(
                children: [
                  SizedBox(
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
                ],
              )),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    "Ингредиенты:",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: HexColor('#B1AFC6'), fontSize: 16),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                          padding: const EdgeInsets.fromLTRB(32, 10, 32, 5),
                          child: CoctailIngridient(
                              cocktail.ingredients.elementAt(index)),
                        ),
                    childCount: cocktail.ingredients.length),
              ),
              SliverToBoxAdapter(
                  child: const SizedBox(
                height: 30,
              )),
              SliverToBoxAdapter(
                child: Container(
                  color: HexColor('#201F2C'),
                  padding: const EdgeInsets.fromLTRB(42, 20, 32, 10),
                  child: Text(
                    "Инструкция для приготовления:",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                          color: HexColor('#201F2C'),
                          padding: const EdgeInsets.fromLTRB(32, 10, 32, 0),
                          child: CoctailInstruction(
                              _instructions.elementAt(index)),
                        ),
                    childCount: _instructions.length),
              ),
              SliverToBoxAdapter(
                  child: StarRatingWidjet(
                stars: 3,
              )),
            ],
          )),
        ));
  }
}
