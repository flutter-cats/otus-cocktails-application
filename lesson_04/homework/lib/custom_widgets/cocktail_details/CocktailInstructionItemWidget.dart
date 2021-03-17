import 'package:flutter/material.dart';
import 'package:homework/models/src/model/ingredient_definition.dart';
import 'package:homework/resources/Colors.dart';

class CocktailInstructionItemWidget extends StatelessWidget {
  const CocktailInstructionItemWidget(
    this.instruction, {
    Key key,
  }) : super(key: key);

  final String instruction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 32, right: 36, top: 8, bottom: 8),
      child: Text('\u2022 $instruction',
          style: TextStyle(
              fontFamily: 'SF Pro Text', fontSize: 14, color: AppColors.white)),
    );
  }
}
