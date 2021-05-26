// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktails_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CocktailsStore on _CocktailsStoreBase, Store {
  Computed<bool>? _$hasResultsComputed;

  @override
  bool get hasResults =>
      (_$hasResultsComputed ??= Computed<bool>(() => super.hasResults,
              name: '_CocktailsStoreBase.hasResults'))
          .value;

  final _$_cocktailsFutureAtom =
      Atom(name: '_CocktailsStoreBase._cocktailsFuture');

  @override
  ObservableFuture<Iterable<CocktailDefinition>> get _cocktailsFuture {
    _$_cocktailsFutureAtom.reportRead();
    return super._cocktailsFuture;
  }

  @override
  set _cocktailsFuture(ObservableFuture<Iterable<CocktailDefinition>> value) {
    _$_cocktailsFutureAtom.reportWrite(value, super._cocktailsFuture, () {
      super._cocktailsFuture = value;
    });
  }

  final _$loadCocktailsAsyncAction =
      AsyncAction('_CocktailsStoreBase.loadCocktails');

  @override
  Future<void> loadCocktails() {
    return _$loadCocktailsAsyncAction.run(() => super.loadCocktails());
  }

  @override
  String toString() {
    return '''
hasResults: ${hasResults}
    ''';
  }
}
