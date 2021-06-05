import 'package:cocktail/res/application_colors.dart';
import 'package:cocktail/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget(this.instruction, {Key key}) : super(key: key);

  final String instruction;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ApplicationColors.instructionBackground,
        padding: EdgeInsets.symmetric(vertical: 33, horizontal: 32),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Text(
                    Strings.instruction,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ))
            ]..addAll(instruction
                .split('-')
                .sublist(1)
                .map((e) => _instructionItem(e)))));
  }
}

Widget _instructionItem(String item) {
  return Container(
    child: Text(
      '\u2022 $item',
      style: TextStyle(color: Colors.white, fontSize: 14),
    ),
  );
}
