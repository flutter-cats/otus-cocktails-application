part of 'favourites_cubit.dart';

class FavouritesState extends Equatable {
  const FavouritesState({required this.favouriteCocktailsMap});

  final Map<String, CocktailDefinition> favouriteCocktailsMap;

  FavouritesState copyWith(
      {Map<String, CocktailDefinition>? favouriteCocktailsMap}) {
    return FavouritesState(
        favouriteCocktailsMap:
            favouriteCocktailsMap ?? this.favouriteCocktailsMap);
  }

  Map<String, CocktailDefinition> get favouriteMap => favouriteCocktailsMap;

  @override
  List<Object?> get props => [favouriteCocktailsMap];
}
