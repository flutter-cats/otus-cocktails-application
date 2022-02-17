import 'package:flutter/material.dart';

class CocktailTag extends StatelessWidget {
  final String title;
  final tag;

  CocktailTag({this.title, this.tag});

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
                  color: Color(0xff15151c),
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