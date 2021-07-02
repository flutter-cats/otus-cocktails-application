import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  final icons = List<Widget>.generate(
    24,
    (index) => Container(
      color: Colors.yellow,
      padding: const EdgeInsets.all(8),
      child: Icon(Icons.star),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        verticalDirection: VerticalDirection.down,
        spacing: 24.0,
        runSpacing: 24.0,
        children: icons);
  }
}
