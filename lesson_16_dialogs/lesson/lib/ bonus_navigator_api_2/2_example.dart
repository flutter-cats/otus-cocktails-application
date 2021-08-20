import 'package:flutter/material.dart';

class Navigator2Example extends StatefulWidget {
  Navigator2Example({Key? key}) : super(key: key);

  @override
  _Navigator2ExampleState createState() => _Navigator2ExampleState();
}

class _Navigator2ExampleState extends State<Navigator2Example> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  List<String> values = [];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      onPopPage: (route, result) {
        //route.didPop(result);
        // return false;
        if (!route.didPop(result)) {
          return false;
        }
        values.removeLast();
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
                    values.add('value');
                  });
                },
              ),
            ),
          ),
        ),
        ...values.map((e) {
          return MaterialPage(
            child: Scaffold(
              appBar: AppBar(
                title: Text(e),
              ),
              body: Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          values.add('value ${values.length + 1}');
                        });
                      },
                      child: Text('Add'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          values.clear();
                        });
                      },
                      child: Text('Pop to root'),
                    ),
                  ],
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}
