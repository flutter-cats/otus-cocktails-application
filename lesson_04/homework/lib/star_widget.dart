import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:homework/color_utils.dart';

///я знаю, что изобретаю велосипед, можно было воспользоваться Icon(Icons.star),
///но я хотел поработать с канвой в данном случае
///
///не бейте сильно за магические числа - они нужны, чтобы правильно отрисовать
///бэкграунд звезды и саму звезду
class StarItem extends CustomPainter {
  StarItem(this.starColor, this.backgroundColor);

  StarItem.defaultBackground(this.starColor)
      : backgroundColor = Colors.grey;

  StarItem.def()
      : starColor = Colors.red,
        backgroundColor = Colors.grey;

  final Color starColor;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;

    //little bit coefficients with magic numbers again
    var mid = width / 2;
    var min = math.min(width, height);
    var fat = min / 17;
    var half = min / 2;
    var radius = half - fat;
    mid = mid - half;
    var circleRadius = radius / 1.3;

    var circlePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = backgroundColor;

    canvas.drawCircle(
        Offset(half, half), circleRadius, circlePaint);

    var path = Path();

    var paint = Paint()
      ..color = starColor
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    //little bit magic numbers for drawing star

    path.moveTo(mid + half * 0.5, half * 0.84);
    path.lineTo(mid + half * 1.5, half * 0.84);
    path.lineTo(mid + half * 0.68, half * 1.45);
    path.lineTo(mid + half * 1.0, half * 0.5);
    path.lineTo(mid + half * 1.32, half * 1.45);
    path.lineTo(mid + half * 0.5, half * 0.84);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RatingWidget extends StatefulWidget {
  RatingWidget(this.defaultRating);

  final defaultRating;

  @override
  RatingWidgetState createState() {
    return RatingWidgetState(defaultRating);
  }
}

class RatingWidgetState extends State<RatingWidget> {
  Color defaultBackgroundColor =
      HexColor.fromHex('#2A293A');
  Color disabledStarColor = HexColor.fromHex('#1A1927');
  Color enabledStarColor = Colors.white;

  RatingWidgetState(int rating) {
    setRating(rating);
  }
  int _rating = 5;

  void setRating(int rating) {
    if (rating > 5 || rating < 1) {
      throw ArgumentError('rating should be in 1 to 5');
    } else {
      _rating = rating;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: LayoutBuilder(
                builder: (context, constraints) {
              var penta = constraints.maxWidth / 5;
              return Row(
                children: _getStars(penta),
              );
            })));
  }

  Iterable<Widget> _getStars(double size) {
    var items = <GestureDetector>[];

    for (int i = 0; i < 5; i++) {
      var currentItem = i + 1;
      items.add(GestureDetector(
        child: CustomPaint(
            size: Size(size, size),
            painter: _checkIsActiveRating(currentItem)),
        onTap: () {
          _toggleRating(currentItem);
        },
      ));
    }

    return items;
  }

  StarItem _checkIsActiveRating(int currentItem) {
    if (currentItem <= _rating) {
      return StarItem(
          enabledStarColor, defaultBackgroundColor);
    } else {
      return StarItem(
          disabledStarColor, defaultBackgroundColor);
    }
  }

  void _toggleRating(int rating) {
    setState(() {
      setRating(rating);
    });
  }
}
