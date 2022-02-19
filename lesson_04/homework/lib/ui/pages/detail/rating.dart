import 'package:flutter/material.dart';
import '../../../state_widget.dart';
import 'rating_star.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rating = StateInheritedWidget.of(context).rating;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 24.0),
      height: 96.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          width: 12,
        ),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (_, int index) {
          return RatingStar(
            isEnabled: index < rating,
            key: ValueKey(index),
          );
        },
      ),
    );
  }
}
