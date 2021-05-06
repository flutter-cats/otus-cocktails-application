import 'package:flutter/material.dart';
import 'package:cocktail/style/style.dart';

class StarsRaiting extends StatelessWidget {
  StarsRaiting({
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
      padding: EdgeInsets.fromLTRB(36, 24, 36, 24),
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
