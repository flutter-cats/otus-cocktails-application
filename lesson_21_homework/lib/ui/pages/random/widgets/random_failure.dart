import 'package:flutter/material.dart';

class RandomFailure extends StatelessWidget {
  const RandomFailure({Key? key, required this.exception}) : super(key: key);

  final Exception? exception;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: Text(
          exception.toString(),
        ),
      ),
    );
  }
}
