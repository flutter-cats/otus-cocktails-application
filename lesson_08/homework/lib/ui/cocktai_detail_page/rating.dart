import 'package:flutter/material.dart';
import '../../../cocktail_info_wrapper.dart';

import '../../res/app_dimens.dart';
import 'rating_star.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rating = StateInheritedWidget.of(context).rating;
    return Container(
      padding: AppDimensions.ratingStarWidgetPadding,
      height: AppDimensions.ratingStarWidgetHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          width: AppDimensions.ratingStarSpacing,
        ),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (_, int index) {
          return RatingStar(
            isEnabled: index < rating,
            starIndex: index + 1,
          );
        },
      ),
    );
  }
}
