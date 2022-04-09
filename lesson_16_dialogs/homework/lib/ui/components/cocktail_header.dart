import 'package:flutter/material.dart';

class CocktailHeader extends StatelessWidget{
  final String url;
  CocktailHeader({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          Expanded(child: DecoratedBox(
            position: DecorationPosition.foreground,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.0),
                  Colors.black.withOpacity(1),
                ],
              ),
            ),
            child: Image.network(url,
                fit: BoxFit.contain,
            ),
          )),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}