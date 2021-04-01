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
    return Center(
      child: GestureDetector( //Listener
        onTapDown: (details) => print("GestureDetector: onTapDown"),
        // onPointerDown: (event) => print("Listener: onPointerDown"),
        child: Container(
          color: Colors.yellow.withOpacity(0.2),
          height: 200,
          width: 200,
          child: Center(
            child: ElevatedButton(
              onPressed: () => print("ElevatedButton: onPressed"),
              child: Text("ElevatedButton"),
            ),
          ),
        ),
      ),
    );
  }
}
