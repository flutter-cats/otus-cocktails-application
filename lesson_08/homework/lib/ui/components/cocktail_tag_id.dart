import 'package:flutter/material.dart';

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
            color: Color(0xff211d22),
          ),
          color: Color(0xff15151c),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text('id: $id'),
        ),
      ),
    );
  }
}
