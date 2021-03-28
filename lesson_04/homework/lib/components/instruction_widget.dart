import 'package:flutter/material.dart';
import 'package:homework_4/components/description_item_widget.dart';
import 'package:homework_4/style/text_style.dart';

class InstructionWidget extends StatelessWidget {
  final String instruction;

  const InstructionWidget({this.instruction});

  Widget _cooklistInstruction(String input) {
    List<String> temp = input.split('\n');

    List<Text> listTitles = [];

    for (var str in temp) {
      var listTile = Text(
        '\u2022 ${str.substring(1)}\n',
        softWrap: true,
        style: cooklistTextStyle,
      );

      listTitles.add(listTile);
    }

    return Column(children: listTitles);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32.0, 24.0, 26.0, 40.0),
      color: Color(0xFF201F2C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 24.0),
            child: DescriptionItemWidget(
              label: 'Инструкция по приготовлению',
              textStyle: cooklistTitleStyle,
            ),
          ),
          _cooklistInstruction(instruction),
        ],
      ),
    );
  }
}
