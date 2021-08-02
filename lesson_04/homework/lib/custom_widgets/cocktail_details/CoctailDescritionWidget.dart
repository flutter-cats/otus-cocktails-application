import 'package:flutter/material.dart';
import 'package:homework/custom_widgets/cocktail_details/CocktailDescriptionItemWidget.dart';
import 'package:homework/models/src/model/cocktail_category.dart';
import 'package:homework/models/src/model/cocktail_type.dart';
import 'package:homework/models/src/model/glass_type.dart';
import 'package:homework/resources/Colors.dart';
import 'package:homework/resources/Strings.dart';

class CocktailDescriptionWidget extends StatelessWidget {
  const CocktailDescriptionWidget(
    this.cocktailName,
    this.cocktailId,
    this.isFavourite,
    this.cocktailCategory,
    this.cocktailType,
    this.glassType, {
    Key key,
  }) : super(key: key);

  final String cocktailName;
  final String cocktailId;
  final bool isFavourite;
  final CocktailCategory cocktailCategory;
  final CocktailType cocktailType;
  final GlassType glassType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 33.0, left: 33.0, right: 34.0, bottom: 24.0),
      color: AppColors.cocktail_description_background_color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: [
                Text(
                  cocktailName,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontFamily: 'SF Pro Text'),
                ),
                Spacer(),
                Visibility(
                    child: Image.asset('assets/images/favourite_item_ic.png'),
                    visible: isFavourite),
              ],
            ),
          ),
          Text(
            'Id:$cocktailId',
            style: TextStyle(
                fontFamily: 'SF Pro Text',
                color: AppColors.id_title_color,
                fontSize: 13),
          ),
          CocktailDescriptionItemWidget(
              AppStrings.cocktail_category_title, cocktailCategory.name),
          CocktailDescriptionItemWidget(
              AppStrings.cocktail_type_title, cocktailType.name),
          CocktailDescriptionItemWidget(
              AppStrings.cocktail_glass_type, glassType.name)
        ],
      ),
    );
  }
}
