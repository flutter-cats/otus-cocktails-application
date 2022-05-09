import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/src/model/cocktail_definition.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStoreBase with _$FavoritesStore;

abstract class _FavoritesStoreBase with Store {
  _FavoritesStoreBase() {
    _loadFavoritesMap();
  }

  late SharedPreferences _prefs;
  final favoritesMap = ObservableMap<String, CocktailDefinition>();

  void _loadFavoritesMap() async {
    _prefs = await SharedPreferences.getInstance();
    final keys = _prefs.getKeys();

    for (String key in keys) {
      final def = jsonDecode(_prefs.get(key).toString());
      favoritesMap[key] = CocktailDefinition.fromJson(def);
    }
  }

  @action
  void addToFavorites(CocktailDefinition cocktailDefinition) {
    final str;
    if (cocktailDefinition.id != null) {
      str = cocktailDefinition.id;
      favoritesMap[str] = cocktailDefinition;

      //Альтернатива - при выходе из приложения сохранять сразу все
      if (_prefs.containsKey(str) == false)
        _prefs.setString(str, jsonEncode(cocktailDefinition));
    }
  }

  @action
  void removeFromFavorites(String id) {
    favoritesMap.remove(id);

    if (_prefs.containsKey(id))
      _prefs.remove(id);
  }

  bool isFavorite(String id) => favoritesMap.containsKey(id);
}
