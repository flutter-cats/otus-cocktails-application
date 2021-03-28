import 'package:flutter/material.dart';
import 'package:homework/style/app-text-style.dart';

class Instruction extends StatelessWidget {
  Instruction({Key key, @required this.instruction});

  final String instruction;
  final String instructionTitle = 'Инструкция для приготовления';

  @override
  Widget build(BuildContext context) {
    List<Widget> instructionWidgets = instruction
        .split('-')
        .sublist(1)
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
      padding: EdgeInsets.only(
        top: 24,
        right: 32,
        bottom: 40,
        left: 32,
      ),
      alignment: Alignment.topLeft,
    );
  }
}
