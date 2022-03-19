import 'package:flutter/material.dart';
import 'package:homework/models/res/app_colors.dart';
import 'package:homework/cocktail_info_wrapper.dart';

import '../../../models/res/app_dimens.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({Key? key, required this.isEnabled, required this.starIndex})
      : super(key: key);

  final bool isEnabled;
  final int starIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.ratingStarHeight,
      width: AppDimensions.ratingStarWidth,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.starBackground,
      ),
      child: IconButton(
        icon: Icon(
          Icons.star,
          size: AppDimensions.starIconSize,
          color: isEnabled ? AppColors.starEnabled : AppColors.starDisabled,
        ),
        onPressed: () {
          StateInheritedWidget.of(context).setRating(starIndex);
        },
      ),
    );
  }
}
