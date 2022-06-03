import 'package:flutter/material.dart';
import 'package:numismatist/core/error_handler.dart';

class SyncPage extends StatelessWidget with ErrorStatelessHandler {
  const SyncPage({Key? key}) : super(key: key);

  //TODO сделать тут анимацию и синхронизацию каталого с монетами
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: const <Widget>[Text('Синхронизация')],
      ),
    )));
  }
}
