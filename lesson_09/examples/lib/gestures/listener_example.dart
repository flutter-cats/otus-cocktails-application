import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListenerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listener"),
      ),
      body: Center(
        child: _Example(),
      ),
    );
  }
}

class _Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerDown: (event) {
        print("Listener: onPointerDown");
      },
      child: Container(
        color: Colors.blue,
        height: 200,
        width: 200,
        child: Center(
          child: GestureDetector(
            onTapDown: (details) {
              print("GestureDetector: onTapDown");
            },
            child: Container(
              color: Colors.red,
              height: 100,
              width: 100,
            ),
          ),
        ),
      ),
    );
  }
}
