// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trial_calculator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TrialCalculatorStore on _TrialCalculatorStoreBase, Store {
  Computed<int>? _$resultComputed;

  @override
  int get result => (_$resultComputed ??= Computed<int>(() => super.result,
          name: '_TrialCalculatorStoreBase.result'))
      .value;

  final _$_TrialCalculatorStoreBaseActionController =
      ActionController(name: '_TrialCalculatorStoreBase');

  @override
  void setFirstNumber(int value) {
    final _$actionInfo = _$_TrialCalculatorStoreBaseActionController
        .startAction(name: '_TrialCalculatorStoreBase.setFirstNumber');
    try {
      return super.setFirstNumber(value);
    } finally {
      _$_TrialCalculatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSecondNumber(int value) {
    final _$actionInfo = _$_TrialCalculatorStoreBaseActionController
        .startAction(name: '_TrialCalculatorStoreBase.setSecondNumber');
    try {
      return super.setSecondNumber(value);
    } finally {
      _$_TrialCalculatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
result: ${result}
    ''';
  }
}
