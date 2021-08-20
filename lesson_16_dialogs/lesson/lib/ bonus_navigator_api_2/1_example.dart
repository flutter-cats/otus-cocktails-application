import 'package:flutter/material.dart';

class Navigator1Example extends StatefulWidget {
  Navigator1Example({Key? key}) : super(key: key);

  @override
  _Navigator1ExampleState createState() => _Navigator1ExampleState();
}

class _Navigator1ExampleState extends State<Navigator1Example> {
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
        value = null;
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
