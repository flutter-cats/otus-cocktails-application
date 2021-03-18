import 'package:flutter/material.dart';
import 'package:homework/components/cocktail_description_item.dart';

class CoctailInstructionWidget extends StatelessWidget {
  final String instruction;

  const CoctailInstructionWidget({this.instruction});

  Widget _instructionForCookList(String input) {
    List<String> temp = input.split('\n');

    List<Text> listTitles = [];

    for (var str in temp) {
      var listTile = Text(
        '\u2022 ${str.substring(1)}\n',
        softWrap: true,
        style: TextStyle(color: Colors.white),
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
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 24.0),
            child: CoctailDescriptionItem(
              label: 'Инструкция по приготовлению',
            ),
          ),
          _instructionForCookList(instruction),
        ],
      ),
    );
  }
}
