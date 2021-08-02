import 'package:flutter/material.dart';

class CocktailImageWidget extends StatelessWidget {
  const CocktailImageWidget(
    this.imageRes, {
    Key key,
  }) : super(key: key);

  final String imageRes;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(width: double.infinity, child: Image.network(imageRes)),
        Positioned(
            top: 50,
            left: 30,
            child: Image.asset('assets/images/back_ic.png')
        ),
        Positioned(
            top: 50,
            right: 30,
            child: Image.asset('assets/images/move_to_other_screen_ic.png')
        )
      ],
    );
  }
}
