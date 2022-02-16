import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_round_button.dart';
import 'styles.dart';

class ImageHeaderSection extends StatelessWidget {
  const ImageHeaderSection({
    Key key,
    @required this.thumbUrl,
  }) : super(key: key);

  final String thumbUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: 400),
          width: double.infinity,
          child: Image.network(
            thumbUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return CircularProgressIndicator();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomRoundButton(
                onPressed: () => {print("clicked back")},
                child: SvgPicture.asset("assets/images/icon_back.svg"),
                color: buttonDarkBackgroundColor,
              ),
              CustomRoundButton(
                onPressed: () => {print("clicked share")},
                child: SvgPicture.asset("assets/images/icon_out.svg"),
                color: buttonDarkBackgroundColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}