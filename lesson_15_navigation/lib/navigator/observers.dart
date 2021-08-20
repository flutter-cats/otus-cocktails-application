import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson_15_navigation/navigator/pages.dart';

// Для примера реализации NavigatorObserver
final _navigationObserver = CustomObserver();

// Для примера реализации RouteAware
final _routeObserver = RouteObserver();

class NavigatorObserversSamplePage extends StatelessWidget {
  final globalKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: globalKey,
      observers: [
        //_navigationObserver,
        _routeObserver,
      ],
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
                    onPressed: _openPage1,
                    child: Text('Open Page1'),
                  ),
                  TextButton(
                    onPressed: _openPage2,
                    child: Text('Open Page2'),
                  ),
                  TextButton(
                    onPressed: _openPage3,
                    child: Text('Open Page3'),
                  ),
                  TextButton(
                    onPressed: _openPage4,
                    child: Text('Open Page4'),
                  ),
                  TextButton(
                      onPressed: _openRouteAwarePage,
                      child: Text('Open Route Aware Page'))
                ],
              ),
            ),
          );
        });
      },
    );
  }

  _openPage1() {
    globalKey.currentState?.push(MaterialPageRoute(
        settings: RouteSettings(name: 'page1'),
        builder: (context) {
          return SamplePage('Page1');
        }));
  }

  _openPage2() {
    globalKey.currentState?.push(CupertinoPageRoute(builder: (ctx) {
      return SamplePage('Page2');
    }));
  }

  _openPage3() {
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

  _openPage4() {
    globalKey.currentState?.pushNamed('/page4');
  }

  _openRouteAwarePage() {
    globalKey.currentState
        ?.push(MaterialPageRoute(builder: (_) => RouteAwareWidget()));
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

// Пример реализации RouteAware

class RouteAwareWidget extends StatefulWidget {
  const RouteAwareWidget({Key? key}) : super(key: key);

  @override
  _RouteAwareWidgetState createState() => _RouteAwareWidgetState();
}

class _RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    _routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    super.didPush();
    print('didPush:$this');
  }

  @override
  void didPop() {
    super.didPop();
    print('didPop:$this');
  }

  @override
  void didPopNext() {
    super.didPopNext();
    print('didPopNext:$this');
  }

  @override
  void didPushNext() {
    super.didPushNext();
    print('didPushNext:$this');
  }

  @override
  Widget build(BuildContext context) {
    return SamplePage('Route Aware Sample');
  }
}
