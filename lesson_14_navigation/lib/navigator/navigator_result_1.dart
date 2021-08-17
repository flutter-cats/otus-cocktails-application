import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorApiGetResult1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => _openPage1(context),
              child: Text('Пройти опрос'),
            ),
          ],
        ),
      ),
    );
  }

  Future _openPage1(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return _Page();
        },
      ),
    );
    print('result: $result');
  }
}

class _Page extends StatelessWidget {
  const _Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вам нравится Flutter?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => _returnResult(context, true),
              child: Text('Да'),
            ),
            TextButton(
              onPressed: () => _returnResult(context, false),
              child: Text('Нет'),
            ),
          ],
        ),
      ),
    );
  }

  _returnResult(BuildContext context, result) {
    Navigator.of(context).pop(result);
  }
}
