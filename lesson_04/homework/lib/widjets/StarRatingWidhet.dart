import 'package:flutter/material.dart';
import 'package:homework/extensions/Color+Extensions.dart';

class StarRatingWidjet extends StatelessWidget {
  final int stars;
  final int maxRatingCount = 5;
  StarRatingWidjet({this.stars});

  @override
  Widget build(BuildContext context) {
    List<int> _maxStars = List<int>.generate(maxRatingCount, (index) => index);

    return Flexible(
      child: Container(
        padding: EdgeInsets.fromLTRB(35, 40, 35, 10),
        color: HexColor('#201F2C'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [..._maxStars.map((e) => StarRatingItemWidget(e < stars))],
        ),
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
    return Container(
        width: 48,
        height: 48,
        margin: EdgeInsets.all(10),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: HexColor('#2A293A')),
        child: Icon(
          Icons.star,
          color: _getIconColor(),
          size: 32,
        ));
  }

  Color _getIconColor() {
    if (isLiked) {
      return Colors.white;
    } else {
      return HexColor('#1A1927');
    }
  }
}
