import 'package:redux/redux.dart';

import 'action.dart';

class LogMiddleware<T> extends MiddlewareClass<T> {
  @override
  Future<dynamic> call(
      Store<T> store, dynamic action, NextDispatcher next) async {
    if (action is SetFetching) {
      return next(action);
    }

    // set fetching
    // store.dispatch(SetFetching(true));

    // await Future.delayed(Duration(seconds: 3));

    print(action.runtimeType);

    // set not fetching
    // store.dispatch(SetFetching(false));

    return next(action);
  }
}
