import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/models/res/app_colors.dart';
import 'package:homework/state_widget.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({Key? key, required this.isFavourite})
      : super(key: key);

  final isFavourite;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        StateInheritedWidget.of(context)
            .setFavourite(!StateInheritedWidget.of(context).isFavourite);
      },
      icon: SvgPicture.asset(
        'assets/images/icon_hart.svg',
        width: 20.0,
        height: 20.0,
        color: isFavourite
            ? AppColors.likeIconActive
            : AppColors.likeIconNotActive,
      ),
    );
  }
}