import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const RatingStar(color: Colors.white),
          const RatingStar(color: Colors.white),
          const RatingStar(color: Colors.white),
          const RatingStar(color: Color(0xFF1A1927)),
          const RatingStar(color: Color(0xFF1A1927)),
        ],
      ),
    );
  }
}

class RatingStar extends StatelessWidget {
  const RatingStar({
    Key key,
    @required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: const Color(0xFF2A293A),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: FittedBox(
          child: Icon(
            Icons.star_rate,
            size: 32.0,
            color: color,
          ),
        ),
      ),
    );
  }
}
