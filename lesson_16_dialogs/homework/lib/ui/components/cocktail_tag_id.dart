import 'package:flutter/material.dart';

import '../constants.dart';

class CocktailTagId extends StatelessWidget {
  late final String id;

  CocktailTagId({required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Constants.tagIdColor,
          ),
          color: Constants.uncheckedTagColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('id: $id'),
        ),
      ),
    );
  }
}
