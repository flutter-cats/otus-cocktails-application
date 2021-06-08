import 'package:get_it/get_it.dart';
import 'package:lesson_18/provider/deps.dart';
import 'package:lesson_18/states/change_notifier_view.dart';
import 'package:lesson_18/states/future_state.dart';
import 'package:lesson_18/states/simple_state.dart';
import 'package:lesson_18/states/stream_state.dart';

final GetIt di = GetIt.instance;

bool registerDependencies() {
  di.registerFactory(() => SimpleState());
  di.registerFactory(() => FutureState());
  di.registerFactory(() => StreamState());
  di.registerFactory(() => ChangeNotifierState());

  /// Singletons
  di.registerSingleton(ThirdClass());
  di.registerSingleton(SecondClass(thirdClass: di.get()));
  di.registerSingleton(FirstClass(secondClass: di.get()));
  // di.registerSingletonWithDependencies(() => ThirdClass());
  // di.registerSingletonWithDependencies(() => SecondClass(thirdClass: di.get()), dependsOn: [ThirdClass]);
  // di.registerSingletonWithDependencies(() => FirstClass(secondClass: di.get()), dependsOn: [SecondClass]);
  return true;
}
