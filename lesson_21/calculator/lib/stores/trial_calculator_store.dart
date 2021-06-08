import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'trial_calculator_store.g.dart';

class TrialCalculatorStore = _TrialCalculatorStoreBase
    with _$TrialCalculatorStore;

abstract class _TrialCalculatorStoreBase with Store {
  _TrialCalculatorStoreBase({required ValueChanged<int> onResultUpdated}) {
    _disposer = reaction((_) => result, onResultUpdated);
  }

  dispose() {
    _disposer();
  }

  late final ReactionDisposer _disposer;

  final firstNumber = Observable(0);

  final secondNumber = Observable(0);

  @computed
  int get result => firstNumber.value + secondNumber.value;

  @action
  void setFirstNumber(int value) {
    firstNumber.value = value;
  }

  @action
  void setSecondNumber(int value) {
    secondNumber.value = value;
  }
}
