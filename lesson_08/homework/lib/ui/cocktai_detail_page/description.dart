import 'package:flutter/material.dart';

import '../../cocktail_info_wrapper.dart';
import '../../res/app_colors.dart';
import '../../res/app_dimens.dart';
import '../../res/app_strings.dart';
import '../../res/app_styles.dart';
import 'description_item.dart';
import 'favourite_button.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.cocktailName,
    required this.cocktailId,
    required this.cocktailCategory,
    required this.cocktailType,
    required this.glassType,
  }) : super(key: key);

  final String? cocktailName;
  final String? cocktailId;
  final String? cocktailCategory;
  final String? cocktailType;
  final String? glassType;

  @override
  Widget build(BuildContext context) {
    final isFavourite = StateInheritedWidget.of(context).isFavourite;
    return Container(
      padding: AppDimensions.descriptionWidgetPadding,
      color: AppColors.alternativeBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: AppDimensions.listTileContentPadding,
            leading: Text(
              cocktailName!,
              style: AppStyles.cocktailNameTextStyle,
            ),
            trailing: FavouriteButton(isFavourite: isFavourite),
          ),
          Text(
            'id:${cocktailId}',
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
