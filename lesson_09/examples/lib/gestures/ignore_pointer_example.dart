import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IgnorePointerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IgnorePointer"),
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
    return IgnorePointer(
      child: ElevatedButton(
        child: Text("ElevatedButton"),
        onPressed: () {},
      ),
    );
  }
}
