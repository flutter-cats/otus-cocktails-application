import 'package:cocktail/core/src/extensions/Color+Extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FiltersCollectionWidjet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Row(
          children: [Text("First"), Text("Secodn")],
        ),
      ),
    );
  }
}
