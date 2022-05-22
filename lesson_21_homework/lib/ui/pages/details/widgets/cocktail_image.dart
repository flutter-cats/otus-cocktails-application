import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/app_dimens.dart';

class CocktailImageWidget extends StatelessWidget {
  const CocktailImageWidget({
    Key? key,
    required this.width,
    required this.cocktailImageUrl,
    required this.cocktailId,
  }) : super(key: key);

  final double width;
  final String cocktailImageUrl;
  final String cocktailId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
            tag: 'cocktailImage$cocktailId',
            child: Image.network(cocktailImageUrl)),
        Positioned(
          top: AppDimensions.appBarIconButtonTopPositioned,
          left: AppDimensions.backButtonLeftPositioned,
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: SvgPicture.asset(
              'assets/images/icon_back.svg',
              width: AppDimensions.appBarIconButtonSize,
              height: AppDimensions.appBarIconButtonSize,
            ),
          ),
        ),
        Positioned(
          top: AppDimensions.appBarIconButtonTopPositioned,
          right: AppDimensions.logOutButtonRightPositioned,
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/icon_out.svg',
              width: AppDimensions.appBarIconButtonSize,
              height: AppDimensions.appBarIconButtonSize,
            ),
          ),
        ),
      ],
    );
  }
}
