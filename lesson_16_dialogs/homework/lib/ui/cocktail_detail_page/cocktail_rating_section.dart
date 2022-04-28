import 'package:flutter/material.dart';
import 'package:homework/ui/style/colors.dart';

const maxRating = 5;

class CocktailRatingSection extends StatelessWidget {
  const CocktailRatingSection({
    Key? key,
    required this.rating,
  })  : assert(rating <= maxRating),
        super(key: key);

  final int rating;

  Widget ratingPoint({bool isFilled = false}) {
    return Container(
      decoration:
      BoxDecoration(color: Color(0xff2A293A), shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.star,
          color: isFilled ? Colors.white : CustomColors.background,
          size: 48,
        ),
      ),
    );
  }

  List<Widget> ratingPoints() {
    return List<Widget>.generate(
        maxRating, (index) => ratingPoint(isFilled: index < rating));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.background,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: ratingPoints(),
        ),
      ),
    );
  }
}