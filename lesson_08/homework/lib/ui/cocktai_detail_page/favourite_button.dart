import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../cocktail_info_wrapper.dart';
import '../../res/app_colors.dart';
import '../../res/app_dimens.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({Key? key, required this.isFavourite})
      : super(key: key);

  final isFavourite;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        StateInheritedWidget.of(context)
            .setFavourite(!StateInheritedWidget.of(context).isFavourite!);
      },
      icon: SvgPicture.asset(
        'assets/images/icon_hart.svg',
        width: AppDimensions.favouriteButtonSize,
        height: AppDimensions.favouriteButtonSize,
        color: isFavourite
            ? AppColors.likeIconActive
            : AppColors.likeIconNotActive,
      ),
    );
  }
}
