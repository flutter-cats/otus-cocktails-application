import 'package:flutter/material.dart';
import 'package:homework/models/res/app_colors.dart';
import 'package:homework/models/res/strings.dart';

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
      padding: const EdgeInsets.all(32.0),
      color: AppColors.alternativeBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(Strings.instructions),
          const SizedBox(
            height: 23.0,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,
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
