part of 'favourites_cubit.dart';

enum FavouritesStatus { initial, loading, success, empty, failure }

class FavouritesState extends Equatable {
  const FavouritesState(
      {this.favouriteCocktailsMap = const {},
      this.status = FavouritesStatus.initial,
      this.exception});

  final Map<String, CocktailDefinition> favouriteCocktailsMap;
  final FavouritesStatus status;
  final Exception? exception;

  FavouritesState copyWith(
      {Map<String, CocktailDefinition>? favouriteCocktailsMap,
      FavouritesStatus? status,
      Exception? exception}) {
    return FavouritesState(
        favouriteCocktailsMap:
            favouriteCocktailsMap ?? this.favouriteCocktailsMap,
        status: status ?? this.status,
        exception: exception);
  }

  @override
  List<Object?> get props => [favouriteCocktailsMap, status, exception];
}
