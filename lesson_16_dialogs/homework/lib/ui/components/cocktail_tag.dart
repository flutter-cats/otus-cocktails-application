import 'package:flutter/material.dart';
import 'package:homework/ui/constants.dart';

class CocktailTag extends StatelessWidget {
  final String title;
  final tag;

  CocktailTag({required this.title, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                  color: Constants.uncheckedTagColor,
                  borderRadius: BorderRadius.circular(20)
              ),

              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(tag.value),
              ),
            ),
          )
        ],
      ),
    );
  }
}