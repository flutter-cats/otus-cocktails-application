import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cocktail/style/style.dart';

class FavoriteButton extends StatelessWidget {
  final String _favoriteIcon = 'assets/images/icons/icon_heart.svg';
  final bool isFavorite;
  final Function toggleFavorite;

  FavoriteButton({
    this.isFavorite,
    this.toggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: IconButton(
        padding: EdgeInsets.all(0),
        icon: SvgPicture.asset(
          _favoriteIcon,
          color: isFavorite
              ? AppColors.primaryText
              : Color.fromRGBO(255, 255, 255, 0.3),
        ),
        onPressed: () => toggleFavorite(!isFavorite),
      ),
    );
  }
}
