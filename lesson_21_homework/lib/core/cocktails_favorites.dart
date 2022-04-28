import 'package:hive/hive.dart';
import 'package:lesson_21_animations_homework/core/hive_helper.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:mobx/mobx.dart';

part 'cocktails_favorites.g.dart';

class CocktailsFavorites = CocktailsFavoritesBase with _$CocktailsFavorites;

abstract class CocktailsFavoritesBase with Store {
  final _box = Hive.box(HiveHelper.boxName);

  CocktailsFavoritesBase() {
    favorites.addAll(_box.toMap().values.cast());
  }

  // будет медленнее чем Map в операциях поиска O(n) vs O(1)
  // но повторять решение в примере не стал )
  final favorites = ObservableList<CocktailDefinition>();

  @action
  void addToFavorite(CocktailDefinition cocktailDefinition) {
    final index = favorites.indexWhere((element) => element.id == cocktailDefinition.id);
    if (index == -1) {
      favorites.add(cocktailDefinition);
      _box.add(cocktailDefinition);
    }
  }

  @action
  void removeFromFavorites(String id) {
    final index = favorites.indexWhere((element) => element.id == id);
    if (index != -1) {
      favorites.removeAt(index);
      _box.deleteAt(index);
      // _box.close()
    }
  }

  bool isFavorite(String id) => favorites.indexWhere((element) => element.id == id) != -1;
}
