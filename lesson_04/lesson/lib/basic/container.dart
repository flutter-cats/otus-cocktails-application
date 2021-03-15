import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _example1();
  }

  Widget _example1() {
    return Center(
      child: Container(
        constraints: BoxConstraints.expand(width: 100, height: 100),
        decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        child: Container(color: Colors.green),
      ),
    );
  }

  Widget _example2() {
    return Center(
      child: Container(
        color: Colors.green,
        padding: const EdgeInsets.all(16),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          child: Icon(
            Icons.verified_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
