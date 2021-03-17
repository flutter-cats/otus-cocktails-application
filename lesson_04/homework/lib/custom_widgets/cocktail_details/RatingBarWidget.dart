import 'package:flutter/cupertino.dart';
import 'package:homework/custom_widgets/cocktail_details/RatingBarItemWidget.dart';
import 'package:homework/resources/Colors.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget(this.rating, {
    Key key,
  }) : super(key: key);

  final int rating;
  final int maxRatingCount = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cocktail_description_background_color,
      padding: EdgeInsets.all(16),
      child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: _getRatingBarItems(),
    ),);
  }

  List<Widget> _getRatingBarItems() {
    var utilRatingList = List<int>.generate(maxRatingCount, (index) => index);
    return List<Widget>()
      ..addAll(utilRatingList.map((e) => RatingBarItemWidget(e < rating)));
  }
}
