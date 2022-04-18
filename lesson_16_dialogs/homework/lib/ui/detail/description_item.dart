import 'package:flutter/material.dart';

import '../../core/src/res/app_colors.dart';
import '../../core/src/res/app_dimens.dart';
import '../../core/src/res/app_styles.dart';

class DescriptionItem extends StatelessWidget {
  const DescriptionItem(
      {Key? key, required this.descriptionName, required this.descriptionValue})
      : super(key: key);

  final String descriptionName;
  final String descriptionValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppDimensions.descriptionItemTopPadding,
        ),
        Text(
          descriptionName,
          style: AppStyles.descriptionNameTextStyle,
        ),
        Chip(
          label: Text(descriptionValue),
          backgroundColor: AppColors.chipBackground,
        ),
      ],
    );
  }
}
