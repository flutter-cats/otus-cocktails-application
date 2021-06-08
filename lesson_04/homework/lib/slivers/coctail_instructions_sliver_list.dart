import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:homework/widjets/CoctailDetailsInstrictions.dart';
import 'package:homework/extensions/Color+Extensions.dart';

class CoctailInstructionSliverList extends StatelessWidget {
  final String instruction;

  CoctailInstructionSliverList(this.instruction);

  List<String> get _instructions {
    return instruction.split('- ').sublist(1).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 24),
          child: Text(
            "Ингредиенты:",
            style: TextStyle(color: HexColor('#B1AFC6')),
          ),
        ),
        Column(
          children: [
            ..._instructions
                .map((instruction) => CoctailInstruction(instruction))
          ],
        ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //       (context, index) =>
        //           CoctailInstruction(_instructions.elementAt(index)),
        //       childCount: _instructions.length),
        // )
      ],
    );
  }
}
