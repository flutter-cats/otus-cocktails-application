import 'package:flutter/material.dart';

import 'pages.dart';

class NavigatorNamedRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        if (settings.name == '/page1') {
          return MaterialPageRoute(
            builder: (context) {
              return SamplePage('Page 1');
            },
          );
        }
        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('Страница не найдена :('),
            ),
          );
        });
      },
      onGenerateInitialRoutes:
          (NavigatorState navigator, String initialRoute) => [
        MaterialPageRoute(builder: (context) {
          return _RootPage();
        })
      ],
    );
  }
}

class _RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            TextButton(
                onPressed: () => _pushPage1(context),
                child: Text('push Page1')),
            const SizedBox(height: 16),
            TextButton(
                onPressed: () => _pushPage2(context),
                child: Text('push Page2')),
            const SizedBox(height: 16),
            TextButton(
                onPressed: () => _pushReplacementPage1(context),
                child: Text('push replacement Page1')),
          ],
        ),
      ),
    );
  }

  // PUSH

  _pushPage1(BuildContext context) {
    Navigator.of(context).pushNamed('/page1');
  }

  _pushPage2(BuildContext context) {
    Navigator.of(context).pushNamed('/page2');
  }

  //REPLACE
  _pushReplacementPage1(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/page1');
  }
}
