// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesStore on _FavoritesStoreBase, Store {
  final _$_FavoritesStoreBaseActionController =
      ActionController(name: '_FavoritesStoreBase');

  @override
  void addToFavorites(CocktailDefinition cocktailDefinition) {
    final _$actionInfo = _$_FavoritesStoreBaseActionController.startAction(
        name: '_FavoritesStoreBase.addToFavorites');
    try {
      return super.addToFavorites(cocktailDefinition);
    } finally {
      _$_FavoritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromFavorites(String id) {
    final _$actionInfo = _$_FavoritesStoreBaseActionController.startAction(
        name: '_FavoritesStoreBase.removeFromFavorites');
    try {
      return super.removeFromFavorites(id);
    } finally {
      _$_FavoritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
