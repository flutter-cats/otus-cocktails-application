import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoctailImageWidget extends StatelessWidget {
  final String imageUrl;

  const CoctailImageWidget({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300.0,
          alignment: Alignment.center,
          child: Image.network(imageUrl),
        ),
        Positioned(
          top: 20.0,
          left: 20.0,
          child: SvgPicture.asset('assets/images/icon_back.svg'),
        ),
        Positioned(
          top: 20.0,
          right: 20.0,
          child: SvgPicture.asset('assets/images/icon_out.svg'),
        )
      ],
    );
  }
}