// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalculatorStore on _CalculatorStoreBase, Store {
  Computed<int>? _$resultComputed;

  @override
  int get result => (_$resultComputed ??= Computed<int>(() => super.result,
          name: '_CalculatorStoreBase.result'))
      .value;

  final _$_CalculatorStoreBaseActionController =
      ActionController(name: '_CalculatorStoreBase');

  @override
  void setFirstNumber(int value) {
    final _$actionInfo = _$_CalculatorStoreBaseActionController.startAction(
        name: '_CalculatorStoreBase.setFirstNumber');
    try {
      return super.setFirstNumber(value);
    } finally {
      _$_CalculatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSecondNumber(int value) {
    final _$actionInfo = _$_CalculatorStoreBaseActionController.startAction(
        name: '_CalculatorStoreBase.setSecondNumber');
    try {
      return super.setSecondNumber(value);
    } finally {
      _$_CalculatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
result: ${result}
    ''';
  }
}
