import 'package:flutter/material.dart';

class MediaQuerySample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return MediaQuery(
        data: mediaQuery.copyWith(),
        child: Builder(builder: (context) => _buildInfo(context)));
  }

  Widget _buildInfo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mediaQuery = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'width:${size.width}, height:${size.height}, b ${mediaQuery.devicePixelRatio}',
          style: TextStyle(inherit: false),
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
        )
      ],
    );
  }
}
