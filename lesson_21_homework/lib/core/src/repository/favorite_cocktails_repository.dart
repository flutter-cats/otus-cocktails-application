import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/core/src/model/cocktail_favorite.dart';

class FavoriteCocktailsRepository {
  Map<String?, CocktailFavorite> _favoriteCocktails = {};

  bool isCocktailFavorite(Cocktail cocktail) {
    return _favoriteCocktails.containsKey(cocktail.id);
  }

  bool isCocktailDefinitionFavorite(CocktailDefinition cocktailDefinition) {
    return _favoriteCocktails.containsKey(cocktailDefinition.id);
  }

  void addToFavorite(Cocktail cocktail) {
    if (!_favoriteCocktails.containsKey(cocktail.id))
      _favoriteCocktails[cocktail.id] = CocktailFavorite(cocktail);
  }

  void addToFavoriteByDefinition(CocktailDefinition cocktailDefinition) {
    final id = cocktailDefinition.id;
    final rep = AsyncCocktailRepository();
    rep.fetchCocktailDetails(id!).then((cocktail) => addToFavorite(cocktail!));
  }

  void removeFromFavorite(Cocktail cocktail) {
    if (_favoriteCocktails.containsKey(cocktail.id))
      _favoriteCocktails.remove(cocktail.id);
  }

  void removeFromFavoriteByDefinition(CocktailDefinition cocktailDefinition) {
    AsyncCocktailRepository()
        .fetchCocktailDetails(cocktailDefinition.id!)
        .then((cocktail) => removeFromFavorite(cocktail!));
  }

  Iterable<Cocktail> getFavoriteCocktails() {
    List<Cocktail> result = [];
    _favoriteCocktails.forEach((key, value) => result.add(value));
    return result;
  }

  Iterable<CocktailDefinition> getFavoriteCocktailDefinitions() {
    List<CocktailDefinition> result = [];
    _favoriteCocktails.forEach((key, value) => result.add(CocktailDefinition(
        id: value.id,
        name: value.name,
        drinkThumbUrl: value.drinkThumbUrl,
        isFavourite: true)));
    return result;
  }

  CocktailDefinition getCoctailDefinitionIFFavorite(
      CocktailDefinition cocktailDefinition) {
    return isCocktailDefinitionFavorite(cocktailDefinition)
        ? CocktailDefinition(
            id: cocktailDefinition.id,
            name: cocktailDefinition.name,
            drinkThumbUrl: cocktailDefinition.drinkThumbUrl,
            isFavourite: true)
        : cocktailDefinition;
  }

  CocktailCategory getCategoryByCocktailDefinition(
      CocktailDefinition cocktailDefinition) {
    return _favoriteCocktails[cocktailDefinition.id]!.category!;
  }
}
