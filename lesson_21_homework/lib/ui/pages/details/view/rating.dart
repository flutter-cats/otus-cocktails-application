import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_21_animations_homework/ui/pages/details/cubit/rating_cubit.dart';

import '../../../../app/app_dimens.dart';
import 'rating_star.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingCubit, RatingState>(
      builder: (context, state) {
        final cubit = context.read<RatingCubit>();
        final rating = state.cocktailsRatingList[id] ?? 0;
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
                onTap: () => cubit.updateRating(id, index + 1),
              );
            },
          ),
        );
      },
    );
  }
}
