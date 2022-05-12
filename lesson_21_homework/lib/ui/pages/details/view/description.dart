import 'package:flutter/material.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/ui/favourite_icon_button.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_dimens.dart';
import '../../../../app/app_strings.dart';
import '../../../../app/app_styles.dart';
import 'description_item.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.cocktailName,
    required this.cocktailId,
    required this.cocktailCategory,
    required this.cocktailType,
    required this.glassType,
    required this.cocktailImageUrl,
  }) : super(key: key);

  final String cocktailName;
  final String cocktailId;
  final String cocktailCategory;
  final String cocktailType;
  final String glassType;
  final String cocktailImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimensions.descriptionWidgetPadding,
      color: AppColors.alternativeBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: AppDimensions.listTileContentPadding,
            leading: Text(
              cocktailName,
              style: AppStyles.cocktailNameTextStyle,
            ),
            trailing: FavouriteIconButton(
              CocktailDefinition(
                  id: cocktailId,
                  drinkThumbUrl: cocktailImageUrl,
                  name: cocktailName,
                  cocktailCategory: cocktailCategory),
            ),
          ),
          Text(
            'id:$cocktailId',
            style: AppStyles.cocktailIdTextStyle,
          ),
          DescriptionItem(
            descriptionName: AppStrings.cocktailCategory,
            descriptionValue: cocktailCategory,
          ),
          DescriptionItem(
              descriptionName: AppStrings.cocktailType,
              descriptionValue: cocktailType),
          DescriptionItem(
            descriptionName: AppStrings.glassType,
            descriptionValue: glassType,
          ),
        ],
      ),
    );
  }
}
