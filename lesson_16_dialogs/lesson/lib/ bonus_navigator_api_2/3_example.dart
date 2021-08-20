import 'package:flutter/material.dart';

final _provider = PlatformRouteInformationProvider(
    initialRouteInformation: RouteInformation(location: '/'));

class Navigator3Example extends StatefulWidget {
  Navigator3Example({Key? key}) : super(key: key);

  @override
  _Navigator3ExampleState createState() => _Navigator3ExampleState();
}

class _Navigator3ExampleState extends State<Navigator3Example> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  String? value;

  @override
  Widget build(BuildContext context) {
    return Router(
        routeInformationProvider: _provider,
        routeInformationParser: RouteParser(),
        routerDelegate: ValueRouterDelegate(_navigatorKey));
  }
}

class RoutePath {
  RoutePath(this.value);

  final String? value;

  bool get isListPage => value == null;

  bool get isDetailsPage => value != null;
}

class RouteParser extends RouteInformationParser<RoutePath> {
  @override
  RouteInformation? restoreRouteInformation(RoutePath configuration) {
    print('restoreRouteInformation:${configuration.value}');
    if (configuration.value == null) {
      return RouteInformation(location: '/');
    }
    return RouteInformation(
        location: configuration.value != null
            ? '/values/${configuration.value}'
            : '/');
  }

  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    print('routeInformation:${routeInformation.location}');
    if (routeInformation.location == null) {
      return RoutePath(null);
    }
    final uri = Uri.parse(routeInformation.location!);
    // values/: value
    if (uri.pathSegments.length == 2) {
      final value = uri.pathSegments.last;
      return RoutePath(value);
    }
    return RoutePath(null);
  }
}

class ValueRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  ValueRouterDelegate(this.navigatorKey);

  final GlobalKey<NavigatorState> navigatorKey;

  List<String> values = ['Value1', 'Value2'];

  String? selectedValue;

  @override
  RoutePath? get currentConfiguration {
    return RoutePath(selectedValue);
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    selectedValue = configuration.value;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, result) {
        return route.didPop(result);
      },
      pages: [
        MaterialPage(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Page1'),
            ),
            body: ListView(
              children: [
                ...values.map((e) => TextButton(
                    onPressed: () {
                      //_provider.didPushRouteInformation(RouteInformation(location: '/values/Value1'));
                      selectedValue = e;
                      notifyListeners();
                    },
                    child: Text(e)))
              ],
            ),
          ),
        ),
        if (selectedValue != null)
          MaterialPage(
            child: Scaffold(
              appBar: AppBar(
                title: Text(selectedValue!),
              ),
              body: Center(
                child: TextButton(
                  onPressed: () {
                    selectedValue = null;
                    notifyListeners();
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
