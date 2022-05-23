import 'package:cocktail_app_tests/core/cocktail_db_service.dart';
import 'package:cocktail_app_tests/core/src/model/cocktail_definition.dart';
import 'package:mobx/mobx.dart';

part 'cocktails_favorites.g.dart';

class CocktailsFavorites = CocktailsFavoritesBase with _$CocktailsFavorites;

abstract class CocktailsFavoritesBase with Store {
  final _storage = CocktailsDBService();

  CocktailsFavoritesBase() {
    favorites.addAll(_storage.getAll());
  }

  // будет медленнее чем Map в операциях поиска O(n) vs O(1)
  // но повторять решение в примере не стал )
  final favorites = ObservableList<CocktailDefinition>();

  @action
  void addToFavorite(CocktailDefinition cocktailDefinition) {
    final index = favorites.indexWhere((element) => element.id == cocktailDefinition.id);
    if (index == -1) {
      favorites.add(cocktailDefinition);
      _storage.add(cocktailDefinition);
    }
  }

  @action
  void removeFromFavorites(String id) {
    final index = favorites.indexWhere((element) => element.id == id);
    if (index != -1) {
      favorites.removeAt(index);
      _storage.removeFromFavorites(id);
      // _box.close()
    }
  }

  bool isFavorite(String id) => favorites.indexWhere((element) => element.id == id) != -1;
}
