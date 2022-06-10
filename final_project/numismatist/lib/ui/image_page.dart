import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:numismatist/core/error_handler.dart';
import 'package:numismatist/repository/models/item.dart';

class ImagePageArguments {
  final String title;
  final String tag;
  final Uint8List image;
  ImagePageArguments(
    this.title,
    this.tag,
    this.image,
  );
}

class ImagePage extends StatelessWidget with ErrorStatelessHandler {
  const ImagePage({Key? key}) : super(key: key);

  //показ изображения монеты. виджет Hero
  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)!.settings.arguments as ImagePageArguments);
    return Scaffold(
        appBar: AppBar(
          title: Text(args.title),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Hero(
              tag: args.tag,
              child: Image.memory(args.image),
            ),
          ),
        )));
  }
}
