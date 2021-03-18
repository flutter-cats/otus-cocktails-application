import 'package:flutter/material.dart';

class CoctailDescriptionItem extends StatelessWidget {
  final String label;
  final double leftMargin;
  final double bottomMargin;
  final TextStyle textStyle;

  const CoctailDescriptionItem(
      {this.label, this.leftMargin, this.textStyle, this.bottomMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(leftMargin ?? 0, 0, 0, bottomMargin ?? 0),
        child: Text(
          label,
          style: textStyle,
        ));
  }
}
