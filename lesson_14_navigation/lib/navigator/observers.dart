import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson_14_navigation/navigator/pages.dart';

class NavigatorObserversSamplePage extends StatelessWidget {
  final globalKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: globalKey,
      observers: [CustomObserver()],
      onGenerateRoute: (settings) {
        print('onGenerateRoute');
        if (settings.name == '/page4') {
          return MaterialPageRoute(builder: (context) {
            return SamplePage('Page2');
          });
        }
        return MaterialPageRoute(builder: (ctx) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => _openPage1(context),
                      child: Text('Open Page1')),
                  TextButton(
                      onPressed: () => _openPage2(context),
                      child: Text('Open Page2')),
                  TextButton(
                      onPressed: () => _openPage3(context),
                      child: Text('Open Page3')),
                  TextButton(
                      onPressed: () => _openPage4(context),
                      child: Text('Open Page4'))
                ],
              ),
            ),
          );
        });
      },
    );
  }

  _openPage1(BuildContext context) {
    globalKey.currentState?.push(MaterialPageRoute(
        settings: RouteSettings(name: 'page1'),
        builder: (context) {
          return SamplePage('Page1');
        }));
  }

  _openPage2(BuildContext context) {
    globalKey.currentState?.push(CupertinoPageRoute(builder: (ctx) {
      return SamplePage('Page2');
    }));
  }

  _openPage3(BuildContext context) {
    globalKey.currentState?.push(
      PageRouteBuilder(pageBuilder: (BuildContext context,
          Animation<double> animation, Animation<double> secondaryAnimation) {
        print('pageBuilder:${animation.value}');
        return SamplePage('Page3');
      }, transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      }),
    );
  }

  _openPage4(BuildContext context) {
    globalKey.currentState?.pushNamed('/page4');
  }
}

class CustomObserver extends NavigatorObserver {
  @override
  void didStopUserGesture() {
    print('didStopUserGesture');
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    print('didStartUserGesture: $route');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print('didReplace:$route');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print('didPop:$route');
    if (route.settings.name == 'page1') {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        navigator?.push(CupertinoPageRoute(builder: (context) {
          return SamplePage('Page2');
        }));
      });
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    print('didPush:$route');
  }
}
