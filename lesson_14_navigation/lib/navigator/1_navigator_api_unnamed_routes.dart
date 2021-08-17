import 'package:flutter/material.dart';

import 'pages.dart';

// Пример открытия экрана с помощью инстанцирования Route
// внутри методов push,replace

class NavigatorApiSample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => _pushPage1(context),
                child: Text('push Page1')),
            const SizedBox(height: 16),
            TextButton(
                onPressed: () => _pushReplacementPage1(context),
                child: Text('push replacement Page1')),
          ],
        ),
      ),
    );
  }

  void _pushPage1(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SamplePage('Page1'),
      ),
    );
  }

  void _pushReplacementPage1(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SamplePage('Page1'),
      ),
    );
  }
}
