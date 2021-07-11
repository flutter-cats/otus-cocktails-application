import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework/models/src/model/cocktail.dart';
import 'package:homework/themes/app_text_theme.dart';

class Instruction extends StatelessWidget {
  const Instruction({
    Key key,
    @required this.cocktail,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 32.0,
      ),
      color: const Color(0xFF201F2C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Инструкция для приготовления',
            style: AppTextTheme.body2,
          ),
          const SizedBox(height: 16.0),
          Text(
            cocktail.instruction,
            style: AppTextTheme.body2,
          ),
        ],
      ),
    );
  }
}
