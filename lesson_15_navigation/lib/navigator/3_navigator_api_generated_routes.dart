import 'package:flutter/material.dart';

import 'pages.dart';

class NavigatorGeneratedRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        if (settings.name == '/A') {
          return MaterialPageRoute(builder: (context) {
            return SamplePage('A');
          });
        }
        return null;
      },
      onGenerateInitialRoutes: (NavigatorState navigator, String initialRoute) {
        if (initialRoute == '/A') {
          return <Route>[
            MaterialPageRoute(builder: (context) {
              return SamplePage('PageA');
            })
          ];
        }
        if (initialRoute == '/A/B') {
          return <Route>[
            MaterialPageRoute(builder: (context) {
              return SamplePage('PageA');
            }),
            MaterialPageRoute(builder: (context) {
              return SamplePage('PageB');
            })
          ];
        }
        return <Route>[
          MaterialPageRoute(builder: (context) {
            return SamplePage('PageA');
          })
        ];
      },
      initialRoute: '/A/B',
    );
  }
}
