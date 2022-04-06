import 'package:flutter/material.dart';

class InstructionItem extends StatelessWidget {
  const InstructionItem({Key? key, required this.instructionItem})
      : super(key: key);

  final String instructionItem;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\u2022 ${instructionItem.trim()}',
    );
  }
}
