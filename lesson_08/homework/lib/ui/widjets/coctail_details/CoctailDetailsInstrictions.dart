import 'package:flutter/material.dart';
import '../../../core/src/extensions/Color+Extensions.dart';




class CoctailDetailsInstrictions extends StatelessWidget {
  final String instruction;

  CoctailDetailsInstrictions(this.instruction);

  List<String> get _instructions {
    return instruction.split('- ').sublist(1).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: HexColor('#201F2C'),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                "Инструкция для приготовления:",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ..._instructions.map((e) => CoctailInstruction(e)),
          ],
        ));
  }
}

class CoctailInstruction extends StatelessWidget {
  final String instruction;

  CoctailInstruction(this.instruction);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('\u2022', style: TextStyle(color: Colors.white)),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: Text(instruction, style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
