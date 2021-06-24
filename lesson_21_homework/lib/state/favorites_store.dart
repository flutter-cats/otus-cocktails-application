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

  late SharedPreferences prefs;
  final favoritesMap = ObservableMap<String, CocktailDefinition>();

  void _loadFavoritesMap() async {
    prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    for (String key in keys) {
      final def = jsonDecode(prefs.get(key).toString());
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
      if (prefs.containsKey(str) == false)
        prefs.setString(str, jsonEncode(cocktailDefinition));
    }
  }

  @action
  void removeFromFavorites(String id) {
    favoritesMap.remove(id);

    if (prefs.containsKey(id))
      prefs.remove(id);
  }

  bool isFavorite(String id) => favoritesMap.containsKey(id);
}
