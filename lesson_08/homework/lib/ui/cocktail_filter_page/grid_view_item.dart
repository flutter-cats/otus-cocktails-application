import 'package:flutter/material.dart';

import '../../res/app_colors.dart';
import '../../res/app_dimens.dart';
import '../../res/app_styles.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({Key? key, this.cocktail}) : super(key: key);

  final cocktail;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(AppDimensions.sliverGridChildBorderRadius),
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: NetworkImage(cocktail.drinkThumbUrl),
        ),
      ),
      child: Padding(
        padding: AppDimensions.sliverGridChildPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppDimensions.sliverGridTextPadding,
              child: FractionallySizedBox(
                widthFactor: AppDimensions.sliverGridTextWidthPercent,
                child: Text(
                  cocktail.name,
                  style: AppStyles.sliverGridTitleStyle,
                ),
              ),
            ),
            Chip(
              labelPadding: AppDimensions.categoryChipLabelPadding,
              padding: AppDimensions.categoryChipPadding,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: AppColors.categoryChipBorderColor,
                    width: AppDimensions.categoryChipBorderWidth),
                borderRadius: BorderRadius.circular(
                    AppDimensions.categoryChipBorderRadius),
              ),
              backgroundColor: AppColors.categoryChipBackgroundColor,
              label: Text(
                'id:' + cocktail.id,
                style: AppStyles.sliverGridIdStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
