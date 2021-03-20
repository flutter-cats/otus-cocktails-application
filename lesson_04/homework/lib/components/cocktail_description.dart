import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/components/cocktail_description_item.dart';
import 'cocktail_description_chip.dart';
import 'package:homework/text_styles.dart';

class CoctailDescriptionWidget extends StatelessWidget {
  final String id;
  final String name;
  final String category;
  final String type;
  final String glassType;

  const CoctailDescriptionWidget(
      {this.id, this.name, this.type, this.glassType, this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1A1927),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(32.0, 33, 32, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoctailDescriptionItem(
                  label: name,
                  textStyle: cocktailNameHeaderStyle,
                  bottomMargin: 10.0,
                  leftMargin: 0,
                ),
                CoctailDescriptionItem(
                  label: 'id: $id',
                  bottomMargin: 20.0,
                  textStyle: descriptionIdStyle,
                ),
                CoctailDescriptionItem(
                  label: 'Категория коктейля',
                  bottomMargin: 8.0,
                  textStyle: cocktailTypeStyle,
                ),
                CocktailDescriptionChipDecoration(
                  bottomMargin: 18,
                  child: CoctailDescriptionItem(
                    label: category,
                    textStyle: cocktailValueStyle,
                  ),
                ),
                CoctailDescriptionItem(
                  label: 'Тип коктейля',
                  bottomMargin: 10.0,
                  textStyle: cocktailTypeStyle,
                ),
                CocktailDescriptionChipDecoration(
                  bottomMargin: 16,
                  child: CoctailDescriptionItem(
                    label: type,
                    textStyle: cocktailValueStyle,
                  ),
                ),
                CoctailDescriptionItem(
                  label: 'Тип Стекла',
                  bottomMargin: 10.0,
                  textStyle: cocktailTypeStyle,
                ),
                CocktailDescriptionChipDecoration(
                  child: CoctailDescriptionItem(
                    label: glassType,
                    textStyle: cocktailValueStyle,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30.0,
            right: 30.0,
            child: SvgPicture.asset('assets/images/icon_hart.svg'),
          ),
        ],
      ),
    );
  }
}
