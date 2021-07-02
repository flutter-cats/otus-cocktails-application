import 'package:flutter/material.dart';

class MediaQuerySample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mediaQuery = MediaQuery.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'width:${size.width}\n'
            'height:${size.height}\n'
            'devicePixelRatio: ${mediaQuery.devicePixelRatio}',
          ),
          Container(
            width: 320,
            height: 100,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
