import 'package:flutter/material.dart';
import 'package:homework/resources/Colors.dart';

class RatingBarItemWidget extends StatelessWidget {
  const RatingBarItemWidget(
    this.isLiked, {
    Key key,
  }) : super(key: key);
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          width: 48,
          height: 48,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.cocktail_item_rating_background),
          child: Icon(
            Icons.star,
            color: _getIconColor(),
            size: 32,
          )),
    );
  }

  Color _getIconColor() {
    if (isLiked) {
      return AppColors.white;
    } else {
      return AppColors.cocktail_description_background_color;
    }
  }
}
