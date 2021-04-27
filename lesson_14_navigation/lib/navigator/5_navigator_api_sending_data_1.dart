import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson_14_navigation/navigator/pages.dart';

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
          ],
        ),
      ),
    );
  }

  _openPage1(BuildContext context) async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SamplePage2();
    }));
  }
}
