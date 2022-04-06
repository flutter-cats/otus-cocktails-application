import 'package:flutter/material.dart';

import '../../res/app_colors.dart';
import '../../res/app_dimens.dart';
import '../../res/app_styles.dart';

class DescriptionItem extends StatelessWidget {
  const DescriptionItem(
      {Key? key, required this.descriptionName, required this.descriptionValue})
      : super(key: key);

  final descriptionName;
  final descriptionValue;

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
