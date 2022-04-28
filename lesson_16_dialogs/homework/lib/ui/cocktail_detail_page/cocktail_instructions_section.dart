import 'package:flutter/material.dart';

import 'package:homework/ui/style/colors.dart';

class CocktailInstructionsSection extends StatelessWidget {
  const CocktailInstructionsSection({
    Key? key,
    required this.instruction,
  }) : super(key: key);

  final String instruction;

  Widget formattedText() {
    return Column(
      children: instruction.split("\n").map(
            (element) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 8.0,
                    width: 8.0,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    element,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: CustomColors.filter_item_color,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 15.0),
              child: Text(
                "Инструкция для приготовления",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
            formattedText(),
          ],
        ),
      ),
    );
  }
}