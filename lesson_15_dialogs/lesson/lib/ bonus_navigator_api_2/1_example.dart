import 'package:flutter/material.dart';

class Navigator2Example extends StatefulWidget {
  Navigator2Example({Key? key}) : super(key: key);

  @override
  _Navigator2ExampleState createState() => _Navigator2ExampleState();
}

class _Navigator2ExampleState extends State<Navigator2Example> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  String? value;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        setState(() {
          value = null;
        });
        return true;
      },
      pages: [
        MaterialPage(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Page1'),
            ),
            body: Center(
              child: TextButton(
                child: Text('Open'),
                onPressed: () {
                  setState(() {
                    value = 'New Page';
                  });
                },
              ),
            ),
          ),
        ),
        if (value != null)
          MaterialPage(
            child: Scaffold(
              appBar: AppBar(
                title: Text(value!),
              ),
              body: Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      value = null;
                    });
                  },
                  child: Text('Pop'),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
