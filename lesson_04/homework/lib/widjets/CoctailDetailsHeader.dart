// import 'dart:html';

import 'package:flutter/material.dart';

class CoctailDetailsHeader extends StatelessWidget {
  final String imageUrl;

  CoctailDetailsHeader({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.fill)),
      ),
      Positioned(
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => {print("Back Tapped")},
        ),
        left: 4,
        top: 4,
      ),
      Positioned(
        child: IconButton(
          icon: Icon(
            Icons.open_in_new,
            color: Colors.white,
          ),
          onPressed: () => {print("Share Tapped")},
        ),
        right: 4,
        top: 4,
      )
    ]);
  }
}
