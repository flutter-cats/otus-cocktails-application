import 'package:cocktail_app_tests/core/hive_helper.dart';
import 'package:cocktail_app_tests/core/src/model/cocktail_definition.dart';
import 'package:hive/hive.dart';

/*
 Простая реализация CocktailsDBService чтобы было чего тестить
*/
class CocktailsDBService {
  final _box = Hive.box(HiveHelper.boxName);

  CocktailsDBService() {
    _favorites.addAll(_box.toMap().values.cast());
  }

  final _favorites = List<CocktailDefinition>.empty(growable: true);

  bool get isEmpty => _favorites.isEmpty;

  List<CocktailDefinition> getAll() {
    return List.unmodifiable(_favorites);
  }

  void add(CocktailDefinition cocktailDefinition) {
    final index = _favorites.indexWhere((element) => element.id == cocktailDefinition.id);
    if (index == -1) {
      _favorites.add(cocktailDefinition);
      _box.add(cocktailDefinition);
    }
  }

  void removeFromFavorites(String id) {
    final index = _favorites.indexWhere((element) => element.id == id);
    if (index != -1) {
      _favorites.removeAt(index);
      _box.deleteAt(index);
    }
  }
}
