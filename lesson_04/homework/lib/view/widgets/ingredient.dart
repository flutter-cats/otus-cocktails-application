import 'package:flutter/material.dart';

class Ingredient extends StatelessWidget {
  const Ingredient({Key key, this.name, this.measure}) : super(key: key);
  final String name;
  final String measure;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(
          child: Text(
            name,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                decoration: TextDecoration.underline),
          ),
        ),
        Flexible(
            child: Text(
          measure,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ))
      ]),
    );
  }
}
