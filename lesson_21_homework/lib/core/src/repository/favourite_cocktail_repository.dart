import 'package:hive/hive.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

abstract class FavouriteCocktailRepository {
  Map<String, CocktailDefinition> getFavouriteCocktails();

  Future<Map<String, CocktailDefinition>> initFavouriteCocktailRepository();

  Map<String, CocktailDefinition> addFavouriteCocktail(
      CocktailDefinition cocktailDefinition);

  Map<String, CocktailDefinition> removeFavouriteCocktail(
      CocktailDefinition cocktailDefinition);

  bool isCocktailFavourite(CocktailDefinition cocktailDefinition);

  void clearFavourites();
}

class FavouriteCocktailRepositoryImpl extends FavouriteCocktailRepository {
  static const boxName = 'favouriteCocktails';
  static const favouriteCocktailsTypeId = 0;

  late Box<CocktailDefinition> cocktailsBox;

  @override
  Map<String, CocktailDefinition> getFavouriteCocktails() {
    final cocktailsMap =
        Map<String, CocktailDefinition>.from(cocktailsBox.toMap());
    return cocktailsMap;
  }

  @override
  Future<Map<String, CocktailDefinition>>
      initFavouriteCocktailRepository() async {
    if (!Hive.isAdapterRegistered(favouriteCocktailsTypeId)) {
      Hive.registerAdapter(CocktailDefinitionAdapter());
    }
    cocktailsBox = await Hive.openBox(boxName);
    final favouriteCocktails = getFavouriteCocktails();
    return favouriteCocktails;
  }

  @override
  Map<String, CocktailDefinition> addFavouriteCocktail(
      CocktailDefinition cocktailDefinition) {
    cocktailsBox.put(cocktailDefinition.id, cocktailDefinition);
    final favouriteCocktails = getFavouriteCocktails();
    return favouriteCocktails;
  }

  @override
  Map<String, CocktailDefinition> removeFavouriteCocktail(
      CocktailDefinition cocktailDefinition) {
    cocktailsBox.delete(cocktailDefinition.id);
    final favouriteCocktails = getFavouriteCocktails();
    return favouriteCocktails;
  }

  @override
  bool isCocktailFavourite(CocktailDefinition cocktailDefinition) {
    return cocktailsBox.containsKey(cocktailDefinition.id);
  }

  @override
  void clearFavourites() {
    cocktailsBox.clear();
  }
}
