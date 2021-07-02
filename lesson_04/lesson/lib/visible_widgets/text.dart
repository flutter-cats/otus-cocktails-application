import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSimpleText(),
        // _buildStyledText(),
        // _buildStyledTextWithBackground(),
        // _buildStyledTextWithCustomPaint(),
        // _buildMultiColorText(context),
        // _buildTextWithWidgetSpan(context),
      ],
    );
  }

  Widget _buildSimpleText() {
    return Text('Просто текст');
  }

  Widget _buildStyledText() {
    final textStyle = TextStyle(
        // decoration: TextDecoration.lineThrough,
        //decorationStyle: TextDecorationStyle.wavy,
        decorationColor: Colors.red,
        decorationThickness: 1,
        fontSize: 24,
        shadows: [
          Shadow(color: Colors.black, offset: Offset(1, 4), blurRadius: 1),
          Shadow(color: Colors.red, offset: Offset(2, 1), blurRadius: 2)
        ],
        wordSpacing: 1.0,
        fontWeight: FontWeight.w700);

    return Text('Стильный текст', style: textStyle);
  }

  Widget _buildStyledTextWithBackground() {
    final textStyle = TextStyle(
        wordSpacing: 1.0,
        fontWeight: FontWeight.w700,
        backgroundColor: Colors.red);
    return Text('Текст с фоном', style: textStyle);
  }

  Widget _buildStyledTextWithCustomPaint() {
    final paint = ui.Paint()
      ..color = Colors.green
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;
    final textStyle = TextStyle(
      wordSpacing: 1.0,
      fontWeight: FontWeight.w700,
      foreground: paint,
    );

    return Text('Текст с foreground', style: textStyle);
  }

  Widget _buildMultiColorText(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1;
    //RichText
    return Text.rich(
      TextSpan(children: [
        TextSpan(text: 'Текст ', style: textStyle),
        TextSpan(
            text: 'Разного ', style: textStyle?.copyWith(color: Colors.red)),
        TextSpan(
            text: 'Цвета', style: textStyle?.copyWith(color: Colors.green)),
      ]),
    );
  }

  Widget _buildTextWithWidgetSpan(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1;
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: 'Текст ',
          style: textStyle,
        ),
        TextSpan(
          text: 'Разного ',
          style: textStyle?.copyWith(
            color: Colors.red,
          ),
        ),
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Container(
            color: Colors.green,
            width: 12,
            height: 12,
          ),
        ),
        TextSpan(
          text: 'Цвета',
          style: textStyle?.copyWith(color: Colors.green),
        ),
      ]),
    );
  }
}
