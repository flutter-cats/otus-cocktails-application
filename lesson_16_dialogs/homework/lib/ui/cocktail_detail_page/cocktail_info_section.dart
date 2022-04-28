import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/ui/style/colors.dart';

import 'custom_round_button.dart';
import 'package:homework/core/models.dart';

class CocktailInfoSection extends StatelessWidget {
  const CocktailInfoSection(
      this.cocktail, {
        Key? key,
      }) : super(key: key);

  final Cocktail cocktail;

  Widget buildKeyValueGroup(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: new BoxDecoration(
                color: CustomColors.black,
                borderRadius: new BorderRadius.all(Radius.circular(18)),
              ),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: CustomColors.filter_item_color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cocktail.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                CustomRoundButton(
                  onPressed: () {},
                  color: null,
                  child: SvgPicture.asset(
                    "assets/images/icon_hart.svg",
                    color: cocktail.isFavourite ? Colors.red : Colors.white,
                  ),
                )
              ],
            ),
            Text(
              "Id:${cocktail.id}",
              style: TextStyle(
                fontSize: 13.0,
                color: Color(0xff848396),
              ),
            ),
            buildKeyValueGroup("Категория коктейля", cocktail.category.value),
            buildKeyValueGroup("Тип коктейля", cocktail.cocktailType.value),
            buildKeyValueGroup("Тип стекла", cocktail.glassType.value),
          ],
        ),
      ),
    );
  }
}