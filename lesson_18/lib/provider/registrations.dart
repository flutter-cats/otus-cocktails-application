import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lesson_18/main.dart';
import 'package:lesson_18/states/change_notifier_view.dart';
import 'package:lesson_18/states/future_state.dart';
import 'package:lesson_18/states/simple_state.dart';
import 'package:lesson_18/states/stream_state.dart';
import 'package:provider/provider.dart';

FutureState proxyMapper(BuildContext context, FutureState state, FutureState? _) {
  state.content = state.content.map((String title) => '$title | After Proxy').toList();
  return state;
}

const bool useProxy = true;

class Registrations extends StatelessWidget {
  const Registrations({
    required this.app,
    required this.di,
    Key? key,
  }) : super(key: key);

  final App app;
  final GetIt di;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SimpleState>.value(value: di.get()),
        FutureProvider<FutureState>.value(value: di.get<FutureState>().futureContent, initialData: di.get<FutureState>()),
        StreamProvider<StreamState>.value(value: di.get<StreamState>().streamContent, initialData: di.get<StreamState>()),
        ChangeNotifierProvider<ChangeNotifierState>.value(value: di.get<ChangeNotifierState>()),
        if (useProxy) ProxyProvider<FutureState, FutureState>(update: proxyMapper),
      ],
      child: app,
    );
  }
}
