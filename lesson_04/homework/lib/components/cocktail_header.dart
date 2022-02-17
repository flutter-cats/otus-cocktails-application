import 'package:flutter/material.dart';

class CocktailHeader extends StatelessWidget{
  final String url;
  CocktailHeader({this.url});

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
          Expanded(child: Image.network(url, fit: BoxFit.contain)),
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