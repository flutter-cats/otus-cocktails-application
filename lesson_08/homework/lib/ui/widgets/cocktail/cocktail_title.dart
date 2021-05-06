import 'package:flutter/material.dart';
import 'package:cocktail/style/style.dart';

class CocktailTitle extends StatelessWidget {
  const CocktailTitle({
    Key key,
    @required this.id,
    @required this.name,
  }) : super(key: key);

  final String id, name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppTextStyle.primaryTitle,
        ),
        Text(
          'id: $id',
          style: AppTextStyle.hintText.copyWith(
            height: 2,
          ),
        ),
      ],
    );
  }
}
