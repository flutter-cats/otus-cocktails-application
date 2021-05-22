import 'package:lesson_17/app/state/cocktails/cocktails_store.dart';
import 'package:mobx/mobx.dart';

import '../../core/models.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStoreBase with _$FavoritesStore;

//todo persistency?
abstract class _FavoritesStoreBase with Store {
  _FavoritesStoreBase(this._cocktailsStore);

  //todo connect
  final CocktailsStore _cocktailsStore;

  //todo ids only? no duplicates
  //todo attention!
  final favoritesMap = ObservableMap<String, CocktailDefinition>();

  //todo connect with cocktails store

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
