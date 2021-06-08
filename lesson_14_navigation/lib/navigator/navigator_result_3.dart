import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorApiGetResult3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => _openQuestionsFlow(context),
              child: Text('Пройти опрос'),
            ),
          ],
        ),
      ),
    );
  }

  _openQuestionsFlow(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return _QuestionsFlow();
        },
      ),
    );
    print('page 1 result: $result');
  }
}

class _QuestionsFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateInitialRoutes: (_, __) => [
        MaterialPageRoute(builder: (context) {
          return _Page1();
        })
      ],
    );
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

  Future _selectAndNext(BuildContext context, result) async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return _Page2();
        },
      ),
      //result: result
    );
  }
}

class _Page2 extends StatelessWidget {
  const _Page2({Key? key}) : super(key: key);

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
