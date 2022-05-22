import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import '../../../../app/app_dimens.dart';
import '../../../../app/app_strings.dart';
import 'instruction_item.dart';

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget({
    Key? key,
    required this.instructions,
  }) : super(key: key);

  final String instructions;

  @override
  Widget build(BuildContext context) {
    final instructionsSplit = instructions.split('.');
    final instructionsList =
        instructionsSplit.sublist(0, instructionsSplit.length - 1);
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
