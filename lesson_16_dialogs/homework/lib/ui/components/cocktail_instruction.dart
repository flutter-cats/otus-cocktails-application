import 'package:flutter/material.dart';
import 'package:homework/ui/constants.dart';

class CocktailInstruction extends StatelessWidget {
  final String instruction;

  CocktailInstruction({required this.instruction});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.instructionBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Инструкция для приготовления'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: _renderText(instruction.replaceAll('-', '·')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> _renderText(String text) {
  List<String> array = text.split('\n');
  return array.map((str) => Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
      child: Text(str))).toList();
}