import 'package:cocktail/constants.dart';
import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  const BaseText(this.text, {Key? key, this.style, this.textAlign, this.maxLines = 1})
      : super(key: key);

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}

class Text400 extends BaseText {
  Text400(String text,
      {TextAlign? textAlign, int maxLines = 1, Color color = kWhiteColor, required double fontSize})
      : super(
          text,
          textAlign: textAlign,
          maxLines: maxLines,
          style: kTextStyle400.copyWith(color: color, fontSize: fontSize),
        );
}

class Text500 extends BaseText {
  Text500(String text,
      {TextAlign? textAlign, int maxLines = 1, Color color = kWhiteColor, required double fontSize})
      : super(
          text,
          textAlign: textAlign,
          maxLines: maxLines,
          style: kTextStyle500.copyWith(color: color, fontSize: fontSize),
        );
}
