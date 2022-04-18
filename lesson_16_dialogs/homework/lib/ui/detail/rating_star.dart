import 'package:flutter/material.dart';
import '../../core/src/res/app_colors.dart';
import '../../core/src/res/app_dimens.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({Key? key, required this.isEnabled, required this.onTap})
      : super(key: key);

  final bool isEnabled;
  final VoidCallback onTap;

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
        onPressed: onTap,
      ),
    );
  }
}
