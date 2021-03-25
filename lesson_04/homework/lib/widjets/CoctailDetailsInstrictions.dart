import 'package:flutter/material.dart';
import 'package:homework/extensions/Color+Extensions.dart';
import 'package:homework/models/models.dart';
import 'package:homework/models/src/model/cocktail_type.dart';

class CoctailDetailsInstrictions extends StatelessWidget {
  final String instruction;

  CoctailDetailsInstrictions({this.instruction});

  List<String> get _instructions {
    return instruction.split('-').sublist(1).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                "Инструкция для приготовления:",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
                child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: _instructions.length,
              itemBuilder: (ctx, i) =>
                  CoctailInstruction(instruction: _instructions.elementAt(i)),
            )),
          ],
        ));
  }
}

class CoctailInstruction extends StatelessWidget {
  final String instruction;

  CoctailInstruction({this.instruction});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.point_of_sale),
          Expanded(
              child: Text(instruction, style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
