import 'package:mobx/mobx.dart';

import '../../core/models.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStoreBase with _$FavoritesStore;

// TODO Persistency (hive, shared_preferences etc)
abstract class _FavoritesStoreBase with Store {
  _FavoritesStoreBase();

  final favoritesMap = ObservableMap<String, CocktailDefinition>();

  @action
  void addToFavorites(CocktailDefinition cocktailDefinition) {
    favoritesMap[cocktailDefinition.id] = cocktailDefinition;
  }

  @action
  void removeFromFavorites(String id) {
    favoritesMap.remove(id);
  }

  bool isFavorite(String id) => favoritesMap.containsKey(id);
}
