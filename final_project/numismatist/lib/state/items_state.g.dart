// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemsState on _ItemsState, Store {
  Computed<LoadProcessState>? _$stateComputed;

  @override
  LoadProcessState get state =>
      (_$stateComputed ??= Computed<LoadProcessState>(() => super.state,
              name: '_ItemsState.state'))
          .value;

  late final _$_itemsFutureAtom =
      Atom(name: '_ItemsState._itemsFuture', context: context);

  @override
  ObservableFuture<List<Item>>? get _itemsFuture {
    _$_itemsFutureAtom.reportRead();
    return super._itemsFuture;
  }

  @override
  set _itemsFuture(ObservableFuture<List<Item>>? value) {
    _$_itemsFutureAtom.reportWrite(value, super._itemsFuture, () {
      super._itemsFuture = value;
    });
  }

  late final _$itemsAtom = Atom(name: '_ItemsState.items', context: context);

  @override
  ObservableList<Item> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<Item> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_ItemsState.errorMessage', context: context);

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

  late final _$getItemsAsyncAction =
      AsyncAction('_ItemsState.getItems', context: context);

  @override
  Future<dynamic> getItems(String catalogId) {
    return _$getItemsAsyncAction.run(() => super.getItems(catalogId));
  }

  late final _$findItemsAsyncAction =
      AsyncAction('_ItemsState.findItems', context: context);

  @override
  Future<dynamic> findItems(String searchBy) {
    return _$findItemsAsyncAction.run(() => super.findItems(searchBy));
  }

  @override
  String toString() {
    return '''
items: ${items},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
