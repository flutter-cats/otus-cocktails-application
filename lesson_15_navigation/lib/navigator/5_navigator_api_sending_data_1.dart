import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson_15_navigation/navigator/pages.dart';

class NavigatorApiSendingDataSample extends StatelessWidget {
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
              child: Text('Open Page 1'),
            ),
            TextButton(
              onPressed: () => _openPage2(context),
              child: Text('Open Page 2'),
            ),
          ],
        ),
      ),
    );
  }


  _openPage1(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SamplePage('Page 1');
        },
      ),
    );
  }

  _openPage2(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        settings: RouteSettings(arguments: 'Page 22'),
        builder: (context) {
          return SamplePage2();
        },
      ),
    );
  }
}
