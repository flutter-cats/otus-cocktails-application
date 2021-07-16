import 'package:flutter/material.dart';
import 'package:lesson_8/builders/future_builder.dart';
import 'package:lesson_8/builders/layout_builder.dart';
import 'package:lesson_8/builders/stream_builder.dart';
import 'package:lesson_8/builders/value_listenable_builder.dart';
import 'package:lesson_8/keys/example_01.dart';
import 'package:lesson_8/keys/example_02.dart';
import 'package:lesson_8/keys/example_03.dart';
import 'package:lesson_8/keys/example_04_unique_key.dart';
import 'package:lesson_8/keys/example_global_05.dart';
import 'package:lesson_8/keys/example_global_06.dart';
import 'package:lesson_8/keys/example_global_07.dart';
import 'package:lesson_8/keys/multiple_widgets.dart';

final List<Widget> examples = [
  const Example01(),
  const Example02(),
  const Example03(),
  const Example04(),
  const ExampleGlobal05(),
  const ExampleGlobal06(),
  const ExampleGlobal07(),
  FutureBuilderSample(), // 8
  const StreamBuilderSample(), // 9
  const LayoutBuilderSample(), // 10
  const ValueListenableSample(), // 11
  const MultipleWidgets(), // 12
];

void main() {
  const int number = 11;
  runApp(
    MaterialApp(
      home: examples[number - 1],
    ),
  );
}
