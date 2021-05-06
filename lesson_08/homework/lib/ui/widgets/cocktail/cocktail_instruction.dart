import 'package:flutter/material.dart';
import 'package:cocktail/style/style.dart';

class CocktailInstruction extends StatelessWidget {
  const CocktailInstruction({Key key, @required this.instruction});

  final String instruction;
  final String instructionTitle = 'Инструкция для приготовления';

  @override
  Widget build(BuildContext context) {
    List<String> instructions = instruction.split('-');
    List<String> instructionList =
        instructions.length == 1 ? [instruction] : instructions.sublist(1);
    List<Widget> instructionWidgets = instructionList
        .map(
          (text) => Row(
            children: [
              Text(
                '\u2022',
                style: AppTextStyle.primaryText,
              ),
              Flexible(
                child: Text(
                  text,
                  style: AppTextStyle.primaryText,
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        )
        .toList();

    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              instructionTitle,
              style: AppTextStyle.primaryText,
            ),
            padding: EdgeInsets.only(
              bottom: 24,
              left: 12,
            ),
          ),
          ...instructionWidgets,
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
      ),
      padding: EdgeInsets.fromLTRB(32, 24, 40, 32),
      alignment: Alignment.topLeft,
    );
  }
}
