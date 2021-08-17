import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorApiGetResult2 extends StatelessWidget {
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
          return _Page1();
        },
      ),
    );
    print('page 1 result: $result');
  }
}

class _Page1 extends StatelessWidget {
  const _Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вам есть 18?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => _selectAndNext(context, true),
              child: Text('Да'),
            ),
            TextButton(
              onPressed: () => _selectAndNext(context, false),
              child: Text('Нет'),
            ),
          ],
        ),
      ),
    );
  }

  Future _selectAndNext(BuildContext context, bool result) async {
    final result2 =
        await Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        return _Page2();
      },
    ), result: result);
    print('page2 result:${result2}');
  }

  // Future _selectAndNext(BuildContext context, result) async {
  //   final result = await Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return _Page2();
  //       },
  //     ),
  //     //result: result
  //   );
  //   print('page2 result:${result}');
  // }
}

class _Page2 extends StatelessWidget {
  const _Page2({
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
              onPressed: () => _selectAndPop(context, true),
              child: Text('Да'),
            ),
            TextButton(
              onPressed: () => _selectAndPop(context, false),
              child: Text('Нет'),
            ),
          ],
        ),
      ),
    );
  }

  _selectAndPop(BuildContext context, result) {
    Navigator.of(context).pop(result);
  }
}
