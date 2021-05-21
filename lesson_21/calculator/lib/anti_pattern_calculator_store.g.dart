// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anti_pattern_calculator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AntiPatternCalculatorStore on _AntiPatternCalculatorStoreBase, Store {
  Computed<int>? _$resultComputed;

  @override
  int get result => (_$resultComputed ??= Computed<int>(() => super.result,
          name: '_AntiPatternCalculatorStoreBase.result'))
      .value;

  final _$firstNumberAtom =
      Atom(name: '_AntiPatternCalculatorStoreBase.firstNumber');

  @override
  int get firstNumber {
    _$firstNumberAtom.reportRead();
    return super.firstNumber;
  }

  @override
  set firstNumber(int value) {
    _$firstNumberAtom.reportWrite(value, super.firstNumber, () {
      super.firstNumber = value;
    });
  }

  final _$secondNumberAtom =
      Atom(name: '_AntiPatternCalculatorStoreBase.secondNumber');

  @override
  int get secondNumber {
    _$secondNumberAtom.reportRead();
    return super.secondNumber;
  }

  @override
  set secondNumber(int value) {
    _$secondNumberAtom.reportWrite(value, super.secondNumber, () {
      super.secondNumber = value;
    });
  }

  final _$_AntiPatternCalculatorStoreBaseActionController =
      ActionController(name: '_AntiPatternCalculatorStoreBase');

  @override
  void setFirstNumber(int value) {
    final _$actionInfo = _$_AntiPatternCalculatorStoreBaseActionController
        .startAction(name: '_AntiPatternCalculatorStoreBase.setFirstNumber');
    try {
      return super.setFirstNumber(value);
    } finally {
      _$_AntiPatternCalculatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSecondNumber(int value) {
    final _$actionInfo = _$_AntiPatternCalculatorStoreBaseActionController
        .startAction(name: '_AntiPatternCalculatorStoreBase.setSecondNumber');
    try {
      return super.setSecondNumber(value);
    } finally {
      _$_AntiPatternCalculatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firstNumber: ${firstNumber},
secondNumber: ${secondNumber},
result: ${result}
    ''';
  }
}
