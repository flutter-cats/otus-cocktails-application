import 'package:flutter/material.dart';
import '../../res/app_styles.dart';

class GridError extends StatelessWidget {
  const GridError({Key? key, this.snapshot}) : super(key: key);
  final snapshot;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Text(
          snapshot.error.toString(),
          style: AppStyles.gridErrorTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
