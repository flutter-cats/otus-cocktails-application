import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_dimens.dart';
import '../../../../app/app_styles.dart';

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
