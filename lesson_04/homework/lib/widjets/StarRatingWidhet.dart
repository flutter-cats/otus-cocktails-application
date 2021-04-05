import 'package:flutter/material.dart';
import 'package:homework/extensions/Color+Extensions.dart';

class StarRatingWidjet extends StatelessWidget {
  final int stars;
  final int maxRatingCount = 5;
  StarRatingWidjet({this.stars});

  @override
  Widget build(BuildContext context) {
    List<int> _maxStars = List<int>.generate(maxRatingCount, (index) => index);

    return Container(
      padding: const EdgeInsets.fromLTRB(35, 40, 35, 10),
      color: HexColor('#201F2C'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            _maxStars.length, (index) => StarRatingItemWidget(index < stars)),
      ),
    );
  }
}

class StarRatingItemWidget extends StatelessWidget {
  const StarRatingItemWidget(
    this.isLiked, {
    Key key,
  }) : super(key: key);

  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          width: 38,
          height: 38,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: HexColor('#2A293A')),
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Icon(
              Icons.star,
              color: _getIconColor(),
            ),
          )),
    );
  }

  Color _getIconColor() {
    if (isLiked) {
      return Colors.white;
    } else {
      return HexColor('#1A1927');
    }
  }
}
