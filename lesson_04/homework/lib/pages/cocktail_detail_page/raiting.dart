import 'package:flutter/material.dart';
import 'package:homework/style/app_colors.dart';

class Raiting extends StatelessWidget {
  Raiting({
    Key key,
    @required this.raiting,
    this.maxRatingCount = 5,
  });

  final int raiting;
  final int maxRatingCount;

  @override
  Widget build(BuildContext context) {
    List<Widget> raitingList = List.generate(maxRatingCount,
        (i) => _buildRatingItem(context: context, isSelected: i < raiting));

    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.only(
        top: 24,
        right: 36,
        bottom: 24,
        left: 36,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: raitingList,
      ),
    );
  }

  Widget _buildRatingItem({BuildContext context, isSelected}) {
    return Container(
        width: 48,
        height: 48,
        margin: EdgeInsets.all(10),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: AppColors.hintText),
        child: Icon(
          Icons.star,
          color: isSelected ? AppColors.primaryText : AppColors.background,
          size: 32,
        ));
  }
}
