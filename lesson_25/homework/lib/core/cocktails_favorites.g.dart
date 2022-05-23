// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktails_favorites.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CocktailsFavorites on CocktailsFavoritesBase, Store {
  late final _$CocktailsFavoritesBaseActionController =
      ActionController(name: 'CocktailsFavoritesBase', context: context);

  @override
  void addToFavorite(CocktailDefinition cocktailDefinition) {
    final _$actionInfo = _$CocktailsFavoritesBaseActionController.startAction(
        name: 'CocktailsFavoritesBase.addToFavorite');
    try {
      return super.addToFavorite(cocktailDefinition);
    } finally {
      _$CocktailsFavoritesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromFavorites(String id) {
    final _$actionInfo = _$CocktailsFavoritesBaseActionController.startAction(
        name: 'CocktailsFavoritesBase.removeFromFavorites');
    try {
      return super.removeFromFavorites(id);
    } finally {
      _$CocktailsFavoritesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
