import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../res/app_dimens.dart';
import '../../res/app_strings.dart';

class ShakerProgress extends StatelessWidget {
  const ShakerProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icon_shaker.svg',
            width: AppDimensions.progressShakerIconSize,
            height: AppDimensions.progressShakerIconSize,
          ),
          const Text(AppStrings.loadingProgressText),
        ],
      ),
    );
  }
}
