import 'package:flutter/material.dart';
import 'package:homework/custom_widgets/cocktail_details/CocktailInstructionItemWidget.dart';
import 'package:homework/models/src/model/cocktail.dart';
import 'package:homework/resources/Colors.dart';

class CocktailInstructionWidget extends StatelessWidget {
  const CocktailInstructionWidget(this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cocktail_instruction_background_color,
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        children:_getInstructions(cocktail.instruction),
      ),
    );
  }

  List<Widget> _getInstructions(String instruction) {
    instruction.split("-");
    return List<Widget>()
      ..add(
        Padding(
            padding: EdgeInsets.only(top: 24, bottom: 16),
            child: Text(
              'Инструкция для приготовления',
              style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 16,
                  color: AppColors.white),
            )),
      )
      ..addAll(instruction.split("-").sublist(1).map((e) =>CocktailInstructionItemWidget(e)));

  }
}
