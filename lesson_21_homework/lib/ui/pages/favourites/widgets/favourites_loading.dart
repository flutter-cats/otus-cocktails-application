import 'package:flutter/material.dart';

import '../../circular_progress_custom.dart';

class FavouritesLoading extends StatelessWidget {
  const FavouritesLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressCustom(),
    );
  }
}
