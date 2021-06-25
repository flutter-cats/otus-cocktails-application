import 'package:flutter/material.dart';

class GestureDetectorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Container(
            height: 100,
            width: 300,
            child: _Content(),
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTapDown: (event) {
        print("Right click");
      },
      onTertiaryTapDown: (_) {
        print("Middle click");
      },
      child: Container(
        color: Colors.amber,
      ),
    );
  }
}
