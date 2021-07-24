import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';

class CustomControllerExample extends StatefulWidget {
  @override
  _CustomControllerExampleState createState() => _CustomControllerExampleState();
}

class _CustomControllerExampleState extends State<CustomControllerExample> {
  final _controller = MyController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom controller"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: _controller,
          minLines: 10,
          maxLines: 10,
        ),
      ),
    );
  }
}

class MyController extends TextEditingController {
  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    final parts = this.value.text.split(" ");

    final partSpans = parts.map((part) {
      return TextSpan(
        text: part,
        style: TextStyle(
          fontWeight: part.contains("b") ? FontWeight.bold : null,
          fontStyle: part.contains("i") ? FontStyle.italic : null,
          color: _hashColor(part.hashCode.toDouble()),
        ),
      );
    });

    final spacedSpans = intersperse(const TextSpan(text: " "), partSpans);

    return TextSpan(
      style: style,
      children: spacedSpans.toList(),
    );
  }

  Color _hashColor(double seed) {
    return Color((lerpDouble(0, 1, seed)! * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}
