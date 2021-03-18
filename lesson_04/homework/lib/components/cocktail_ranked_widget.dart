import 'package:flutter/material.dart';

class CoctailRankBarWidget extends StatelessWidget {
  Widget _getRankedList() {
    int starCount = 3;

    List<Widget> rankedList = [];

    for (int i = 0; i < 5; i++) {
      starCount--;

      Container item = Container(
        width: 48.0,
        height: 48.0,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2A293A)),
        child: Icon(
          Icons.star,
          color: starCount >= 0 ? Colors.white : Color(0xFF1A1927),
          size: 32.0,
        ),
      );

      rankedList.add(item);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: rankedList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1A1927),
      padding: EdgeInsets.all(25.0),
      child: _getRankedList(),
    );
  }
}
