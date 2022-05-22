import 'package:flutter/material.dart';

import '../../circular_progress_custom.dart';

class RandomLoading extends StatelessWidget {
  const RandomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: Center(
        child: CircularProgressCustom(),
      ),
    );
  }
}
