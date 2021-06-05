import 'package:cocktail/res/application_colors.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  static const maxCount = 5;
  final rating = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ApplicationColors.backgroundDescription,
      padding: EdgeInsets.symmetric(vertical: 23, horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _getRating(rating, maxCount),
      ),
    );
  }
}

Widget _ratingItem(bool isActive) {
  return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: ApplicationColors.itemRating),
      child: Icon(
        Icons.star,
        size: 32,
        color:
            isActive ? Colors.white : ApplicationColors.backgroundDescription,
      ));
}

List<Widget> _getRating(int rating, int maxCount) {
  List<Widget> list = [];

  for (int i = 0; i < maxCount; i++) {
    list.add(_ratingItem(i < rating));
  }

  return list;
}
