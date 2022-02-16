import 'package:flutter/material.dart';
import 'package:homework/models/res/app_colors.dart';

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
          height: 18.0,
        ),
        Text(
          descriptionName,
          style: const TextStyle(
            fontSize: 14.0,
            color: AppColors.descriptionName,
          ),
        ),
        Chip(
          label: Text(descriptionValue),
          backgroundColor: AppColors.chipBackground,
        ),
      ],
    );
  }
}
