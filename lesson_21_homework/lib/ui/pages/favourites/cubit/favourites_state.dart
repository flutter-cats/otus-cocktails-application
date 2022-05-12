part of 'favourites_cubit.dart';

class FavouritesState extends Equatable {
  const FavouritesState(this.favouriteCocktailsMap);

  final Map<String, CocktailDefinition> favouriteCocktailsMap;

  bool isCocktailFavorite(String id) {
    return favouriteCocktailsMap.containsKey(id);
  }

  FavouritesState copyWith(
      {Map<String, CocktailDefinition>? favouriteCocktailsMap}) {
    return FavouritesState(favouriteCocktailsMap ?? this.favouriteCocktailsMap);
  }

  @override
  List<Object?> get props => [favouriteCocktailsMap];
}
