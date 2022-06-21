// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalogs_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CatalogsState on CatalogsStateBase, Store {
  Computed<LoadProcessState>? _$countStateComputed;

  @override
  LoadProcessState get countState => (_$countStateComputed ??=
          Computed<LoadProcessState>(() => super.countState,
              name: 'CatalogsStateBase.countState'))
      .value;
  Computed<LoadProcessState>? _$updateStateComputed;

  @override
  LoadProcessState get updateState => (_$updateStateComputed ??=
          Computed<LoadProcessState>(() => super.updateState,
              name: 'CatalogsStateBase.updateState'))
      .value;

  late final _$catalogsAtom =
      Atom(name: 'CatalogsStateBase.catalogs', context: context);

  @override
  ObservableList<Catalog> get catalogs {
    _$catalogsAtom.reportRead();
    return super.catalogs;
  }

  @override
  set catalogs(ObservableList<Catalog> value) {
    _$catalogsAtom.reportWrite(value, super.catalogs, () {
      super.catalogs = value;
    });
  }

  late final _$_countFutureAtom =
      Atom(name: 'CatalogsStateBase._countFuture', context: context);

  @override
  ObservableFuture<int>? get _countFuture {
    _$_countFutureAtom.reportRead();
    return super._countFuture;
  }

  @override
  set _countFuture(ObservableFuture<int>? value) {
    _$_countFutureAtom.reportWrite(value, super._countFuture, () {
      super._countFuture = value;
    });
  }

  late final _$_updateFutureAtom =
      Atom(name: 'CatalogsStateBase._updateFuture', context: context);

  @override
  ObservableFuture<void>? get _updateFuture {
    _$_updateFutureAtom.reportRead();
    return super._updateFuture;
  }

  @override
  set _updateFuture(ObservableFuture<void>? value) {
    _$_updateFutureAtom.reportWrite(value, super._updateFuture, () {
      super._updateFuture = value;
    });
  }

  late final _$needUpdateAtom =
      Atom(name: 'CatalogsStateBase.needUpdate', context: context);

  @override
  bool get needUpdate {
    _$needUpdateAtom.reportRead();
    return super.needUpdate;
  }

  @override
  set needUpdate(bool value) {
    _$needUpdateAtom.reportWrite(value, super.needUpdate, () {
      super.needUpdate = value;
    });
  }

  late final _$needUpdateCountAtom =
      Atom(name: 'CatalogsStateBase.needUpdateCount', context: context);

  @override
  int get needUpdateCount {
    _$needUpdateCountAtom.reportRead();
    return super.needUpdateCount;
  }

  @override
  set needUpdateCount(int value) {
    _$needUpdateCountAtom.reportWrite(value, super.needUpdateCount, () {
      super.needUpdateCount = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'CatalogsStateBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$checkUpdateAsyncAction =
      AsyncAction('CatalogsStateBase.checkUpdate', context: context);

  @override
  Future<void> checkUpdate() {
    return _$checkUpdateAsyncAction.run(() => super.checkUpdate());
  }

  late final _$countAsyncAction =
      AsyncAction('CatalogsStateBase.count', context: context);

  @override
  Future<void> count() {
    return _$countAsyncAction.run(() => super.count());
  }

  late final _$updateAsyncAction =
      AsyncAction('CatalogsStateBase.update', context: context);

  @override
  Future<void> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  @override
  String toString() {
    return '''
catalogs: ${catalogs},
needUpdate: ${needUpdate},
needUpdateCount: ${needUpdateCount},
errorMessage: ${errorMessage},
countState: ${countState},
updateState: ${updateState}
    ''';
  }
}
