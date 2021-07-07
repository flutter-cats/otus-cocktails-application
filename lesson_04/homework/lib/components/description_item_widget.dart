import 'package:flutter/material.dart';

class DescriptionItemWidget extends StatelessWidget {
  final String label;
  final double leftMargin;
  final double bottomMargin;
  final TextStyle textStyle;

  const DescriptionItemWidget({
        this.label,
        this.leftMargin = 0,
        this.textStyle,
        this.bottomMargin = 0
      });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(
            leftMargin,
            0, 0,
            bottomMargin),
        child: Text(
          label,
          style: textStyle,
        ));
  }
}
