import 'package:flutter/widgets.dart';

class RectWidget extends StatelessWidget {
  const RectWidget(
    this.color, {
    Key? key,
    this.size = 24,
  }) : super(key: key);

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: size,
      width: size,
    );
  }
}
