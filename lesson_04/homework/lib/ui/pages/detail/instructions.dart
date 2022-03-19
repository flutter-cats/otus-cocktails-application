import 'package:flutter/material.dart';
import 'package:homework/models/res/app_colors.dart';
import 'package:homework/models/res/app_strings.dart';

import '../../../models/res/app_dimens.dart';
import 'instruction_item.dart';

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget({
    Key? key,
    required this.instructions,
  }) : super(key: key);

  final String instructions;

  @override
  Widget build(BuildContext context) {
    final instructionsList = instructions.split('-').sublist(1);
    return Container(
      padding: AppDimensions.instructionsWidgetPadding,
      color: AppColors.alternativeBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(AppStrings.instructions),
          const SizedBox(
            height: AppDimensions.instructionsListTopPadding,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
              height: AppDimensions.listSeparatorHeight,
            ),
            shrinkWrap: true,
            itemCount: instructionsList.length,
            itemBuilder: (BuildContext context, int index) {
              return InstructionItem(
                instructionItem: instructionsList[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
