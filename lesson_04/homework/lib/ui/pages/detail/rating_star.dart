import 'package:flutter/material.dart';
import 'package:homework/models/res/app_colors.dart';
import 'package:homework/state_widget.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({required Key? key, required this.isEnabled})
      : super(key: key);

  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      width: 48.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.starBackground,
      ),
      child: IconButton(
        icon: Icon(
          Icons.star,
          size: 32.0,
          color: isEnabled ? AppColors.starEnabled : AppColors.starDisabled,
        ),
        onPressed: () {
          StateInheritedWidget.of(context)
              .setRating(int.parse(key.toString()[2]) + 1);
        },
      ),
    );
  }
}
