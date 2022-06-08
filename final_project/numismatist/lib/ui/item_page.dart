import 'package:flutter/material.dart';
import 'package:numismatist/core/error_handler.dart';

class ItemPageArguments {
  final int id;
  ItemPageArguments(this.id);
}

class ItemPage extends StatelessWidget with ErrorStatelessHandler {
  const ItemPage({Key? key}) : super(key: key);

  //TODO показ конкретной монеты. виджет Hero
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: const <Widget>[
          Text('Монета'),
          //Image.memory( )
        ],
      ),
    )));
  }
}
