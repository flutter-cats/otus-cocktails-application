import 'package:hive/hive.dart';
import 'package:lesson_21_animations_homework/core/data/HiveBoxes.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:mobx/mobx.dart';

class FavouriteCocktailsStore with Store {
  late Box<CocktailDefinition> _box;
  final favouriteCocktails = ObservableList<CocktailDefinition>();

  FavouriteCocktailsStore() {
    _box = Hive.box<CocktailDefinition>(HiveBoxes.favouriteCocktails);
    favouriteCocktails.addAll(_box.values);
  }

  @action
  void addCocktail(CocktailDefinition cocktail) async {
    await _box.put(cocktail.id, cocktail);
    favouriteCocktails.add(cocktail);
  }

  @action
  void removeCocktail(CocktailDefinition cocktail) async {
    await _box.delete(cocktail.id);
    favouriteCocktails.removeWhere((element) => element.id == cocktail.id);
  }

  bool isFavorite(String id) {
    return favouriteCocktails.any((element) => element.id == id);
  }

  @computed
  List<CocktailDefinition> get result => favouriteCocktails;
}
