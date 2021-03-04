import 'package:flutter/material.dart';

void main() {
  runApp(
    Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.black,
          fontSize: 40,
        ),
      ),
    ),
  );
}
