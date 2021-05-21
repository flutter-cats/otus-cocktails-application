import 'package:mobx/mobx.dart';

part 'calculator_store.g.dart';

class CalculatorStore = _CalculatorStoreBase with _$CalculatorStore;

abstract class _CalculatorStoreBase with Store {
  _CalculatorStoreBase();

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
