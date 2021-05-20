import 'dart:async';

import 'package:flutter/foundation.dart';

// пример реализации Bloc
// E - event type
// S - state type
abstract class BaseBloc<E, S> {
  BaseBloc(S initialState) {
    _inputController.stream.listen(onEvent);
    updateState(initialState);
  }

  final _inputController = StreamController<E>();

  final _outputController = StreamController<S>.broadcast();

  Sink<E> get sink => _inputController.sink;

  Stream<S> get stream => _outputController.stream;

  late S _state;
  S get state => _state;

  @protected
  void onEvent(E event);

  @protected
  void updateState(S state) {
    _state = state;
    _outputController.add(state);
  }

  @mustCallSuper
  void close() {
    _outputController.close();
    _inputController.close();
  }
}
