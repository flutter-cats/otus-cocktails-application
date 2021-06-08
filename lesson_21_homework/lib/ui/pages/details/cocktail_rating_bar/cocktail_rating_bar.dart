import 'package:flutter/cupertino.dart';
import 'package:lesson_21_animations_homework/ui/style/custom_colors.dart';

import 'cocktail_rating_star.dart';

class CocktailRatingBar extends StatelessWidget {
  final int rating;

  CocktailRatingBar({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.ingredients,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(5, (index) => CocktailRatingStar(isFilled: index < 3)),
        ),
      ),
    );
  }
}
