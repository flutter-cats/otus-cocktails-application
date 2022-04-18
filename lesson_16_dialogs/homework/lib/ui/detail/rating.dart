import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/src/res/app_dimens.dart';
import '../../core/src/res/app_strings.dart';
import 'rating_star.dart';

class RatingWidget extends StatefulWidget {
  const RatingWidget({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  late int rating;

  Future<int> _getRating(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(id)) {
      return prefs.getInt(id)!;
    } else {
      return 1;
    }
  }

  _setRating(int newRating) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(widget.id, newRating);
    setState(() {
      rating = newRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
        future: _getRating(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          if (snapshot.hasData) {
            rating = snapshot.data!;
            return buildRating(rating);
          }
          return const Center(
            child: Text(
              AppStrings.ratingLoadingMessage,
            ),
          );
        });
  }

  buildRating(int rating) {
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
            onTap: () => _setRating(index + 1),
          );
        },
      ),
    );
  }
}
