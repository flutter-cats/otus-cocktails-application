// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesState on _FavoritesState, Store {
  late final _$favoritesAtom =
      Atom(name: '_FavoritesState.favorites', context: context);

  @override
  ObservableList<Favorite> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<Favorite> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$addAsyncAction =
      AsyncAction('_FavoritesState.add', context: context);

  @override
  Future<dynamic> add(Favorite favorite) {
    return _$addAsyncAction.run(() => super.add(favorite));
  }

  late final _$removeAsyncAction =
      AsyncAction('_FavoritesState.remove', context: context);

  @override
  Future<dynamic> remove(Favorite favorite) {
    return _$removeAsyncAction.run(() => super.remove(favorite));
  }

  @override
  String toString() {
    return '''
favorites: ${favorites}
    ''';
  }
}
