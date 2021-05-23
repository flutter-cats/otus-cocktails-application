import 'package:mobx/mobx.dart';

part 'anti_pattern_calculator_store.g.dart';

class AntiPatternCalculatorStore = _AntiPatternCalculatorStoreBase
    with _$AntiPatternCalculatorStore;

abstract class _AntiPatternCalculatorStoreBase with Store {
  @observable
  int firstNumber = 0;

  @observable
  int secondNumber = 0;

  @computed
  int get result => firstNumber + secondNumber;

  @action
  void setFirstNumber(int value) {
    _validateValue(value);

    firstNumber = value;
  }

  @action
  void setSecondNumber(int value) {
    _validateValue(value);

    secondNumber = value;
  }

  bool _validateValue(int value) {
    if (value < 0) throw ArgumentError();

    return true;
  }
}
