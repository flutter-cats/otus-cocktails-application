import 'package:flutter/material.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'app/complex/core/models.dart';
import 'app/complex/core/src/repository/cocktail_repository.dart';
import 'app/complex/redux/reducer.dart';
import 'app/complex/redux/state.dart';
import 'app/complex/ui/root_page.dart';
import 'app/complex/ui/style/theme.dart';
import 'app/simple/redux/middleware.dart';
import 'app/simple/redux/reducer.dart';
import 'app/simple/redux/state.dart';
import 'app/simple/view.dart';
import 'app/stful/stful_example.dart';
import 'home.dart';

void main() {
  runApp(CoreApp());
}

class CoreApp extends StatefulWidget {
  @override
  _CoreAppState createState() => _CoreAppState();
}

class _CoreAppState extends State<CoreApp> {
  late Store<SimpleAppState> _simpleAppStore;
  late DevToolsStore<SimpleAppState> _devToolsSimpleAppStore;
  late Store<AppState> _complexAppStore;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mainThemeData,
      initialRoute: '/',
      routes: {
        '/': (_) => HomeView(),
        'stful_app': (_) => StfulAppExample(),
        'simple_app': (_) {
          _simpleAppStore = Store<SimpleAppState>(
            simpleAppStateReducer,
            initialState: SimpleAppState.init,
            middleware: [LogMiddleware<SimpleAppState>()],
          );
          return SimpleApp(_simpleAppStore);
        },
        'simple_app_dev': (_) {
          _devToolsSimpleAppStore = DevToolsStore<SimpleAppState>(
            simpleAppStateReducer,
            initialState: SimpleAppState.init,
          );

          return ReduxDevToolsContainer(
            store: _devToolsSimpleAppStore,
            child: SimpleApp(
              _devToolsSimpleAppStore,
              devDrawerBuilder: (context) => Theme(
                data: ThemeData.light(),
                child: Drawer(
                  child: Padding(
                    padding: EdgeInsets.only(top: 24.0),
                    child: ReduxDevTools(_devToolsSimpleAppStore),
                  ),
                ),
              ),
            ),
          );
        },
        'complex_app': (_) {
          final repository = AsyncCocktailRepository();
          final thunkMiddleware =
              ExtraArgumentThunkMiddleware<AppState, CocktailRepository>(
                  repository);

          _complexAppStore = Store<AppState>(
            appReducer,
            initialState: AppState.initState,
            middleware: [thunkMiddleware, LogMiddleware<AppState>()],
          );

          return RootPage(_complexAppStore);
        },
      },
    );
  }
}
